// Portal sign-in, shared by every page.
//
// The API has two credentials: the API key (PDE_API_KEY) runs checks from CI and
// nothing else, and a 12-hour session token from login (or register) manages the
// org and its packages. The portal keeps the session token in this tab's
// sessionStorage and sends it on every org / package / catalogue request.
const PdeSession = (() => {
  const KEYS = {
    orgId: "pde_org_id",
    token: "pde_session_token",
    expiresAt: "pde_session_expires_at"
  };

  function clear() {
    Object.values(KEYS).forEach(key => sessionStorage.removeItem(key));
  }

  /** The signed-in session, or null when there is none or it has expired. */
  function current() {
    const orgId = sessionStorage.getItem(KEYS.orgId);
    const token = sessionStorage.getItem(KEYS.token);
    const expiresAt = sessionStorage.getItem(KEYS.expiresAt);
    if (!orgId || !token || !expiresAt) return null;
    if (Date.parse(expiresAt) <= Date.now()) {
      clear();
      return null;
    }
    return { orgId, token, expiresAt };
  }

  function save(orgId, token, expiresAt) {
    sessionStorage.setItem(KEYS.orgId, orgId);
    sessionStorage.setItem(KEYS.token, token);
    sessionStorage.setItem(KEYS.expiresAt, expiresAt);
  }

  async function readJson(response) {
    try {
      return await response.json();
    } catch {
      return {};
    }
  }

  /** The API answers 429 when an address makes too many register / login attempts. */
  const TOO_MANY_REQUESTS =
    "Too many attempts from this address. Wait a few minutes, then try again.";

  /** An error message for a failed response: a clear one for 429, else the API's. */
  function errorMessage(response, data, fallback) {
    if (response.status === 429) return TOO_MANY_REQUESTS;
    return data.error || fallback;
  }

  async function login(email, password) {
    const response = await fetch("/v1/orgs/login", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      // The password is sent exactly as typed: the API never trims it.
      body: JSON.stringify({ email: email.trim(), password })
    });
    const data = await readJson(response);
    if (!response.ok) throw new Error(errorMessage(response, data, "Sign-in failed."));
    save(data.org_id, data.session_token, data.session_expires_at);
    return current();
  }

  let onSignedOut = () => {};

  /**
   * A request to an org route under /v1/orgs/<orgId>; `path` is the part after it.
   * Returns the parsed body; throws with the API's message otherwise. A 401 means
   * the session is gone, so the page goes back to the sign-in form.
   */
  async function api(path, options = {}) {
    const session = current();
    if (!session) {
      onSignedOut();
      throw new Error("Sign in first.");
    }
    const response = await fetch(`/v1/orgs/${encodeURIComponent(session.orgId)}${path}`, {
      method: options.method || "GET",
      headers: {
        "Authorization": `Bearer ${session.token}`,
        "Content-Type": "application/json"
      },
      body: options.body === undefined ? undefined : JSON.stringify(options.body)
    });
    if (response.status === 204) return {};
    const data = await readJson(response);
    if (response.status === 401) {
      clear();
      onSignedOut();
      throw new Error("Your session has ended. Sign in again.");
    }
    if (!response.ok) throw new Error(errorMessage(response, data, `Request failed (${response.status}).`));
    return data;
  }

  /**
   * Show an API key the one time the API returns it (registration or rotation),
   * with a copy button. The portal never stores it.
   */
  function showOneTimeKey(container, apiKey) {
    container.replaceChildren();
    const note = element("p");
    note.append(element("strong", {}, "API key"));
    note.append(" — store it as ");
    note.append(element("code", {}, "PDE_API_KEY"));
    note.append(" in CI. It is shown only this once and is not stored by the portal.");
    container.append(note);
    const row = element("p", { class: "one-time-key" });
    row.append(element("code", {}, apiKey));
    const copy = element("button", { type: "button", class: "secondary-button" }, "Copy");
    copy.addEventListener("click", async () => {
      try {
        await navigator.clipboard.writeText(apiKey);
        copy.textContent = "Copied";
      } catch {
        copy.textContent = "Copy failed: select the key and copy it";
      }
    });
    row.append(copy);
    container.append(row);
  }

  function element(tag, attributes = {}, text) {
    const node = document.createElement(tag);
    Object.entries(attributes).forEach(([name, value]) => node.setAttribute(name, value));
    if (text !== undefined) node.textContent = text;
    return node;
  }

  /**
   * Render the sign-in block into `container`. `onReady(session)` runs once there
   * is a session (straight away when the tab already has one); `onSignOut` runs
   * when the user signs out or the session ends.
   */
  function mount(container, onReady, onSignOut = () => {}) {
    function render() {
      container.replaceChildren();
      const session = current();

      if (session) {
        const until = new Date(session.expiresAt).toLocaleString();
        const line = element("p", { class: "muted" });
        line.append("Signed in to ");
        line.append(element("code", {}, session.orgId));
        line.append(` until ${until}. `);
        const signOut = element("button", { type: "button", class: "text-button" }, "Sign out");
        signOut.addEventListener("click", () => {
          clear();
          onSignOut();
          render();
        });
        line.append(signOut);
        container.append(line);
        onReady(session);
        return;
      }

      const form = element("form", { class: "sign-in-form" });
      form.append(element("h2", {}, "Sign in"));
      form.append(element("label", { for: "sign_in_email" }, "Contact email"));
      form.append(element("input", { id: "sign_in_email", type: "email", autocomplete: "email", required: "" }));
      form.append(element("label", { for: "sign_in_password" }, "Password"));
      form.append(element("input", {
        id: "sign_in_password",
        type: "password",
        autocomplete: "current-password",
        required: ""
      }));
      const button = element("button", { type: "submit" }, "Sign in");
      form.append(button);
      const error = element("p", { class: "sign-in-error", role: "alert" });
      error.hidden = true;
      form.append(error);

      form.addEventListener("submit", async event => {
        event.preventDefault();
        error.hidden = true;
        button.disabled = true;
        button.textContent = "Signing in...";
        try {
          await login(form.querySelector("#sign_in_email").value, form.querySelector("#sign_in_password").value);
          render();
        } catch (err) {
          error.textContent = err instanceof Error ? err.message : "Sign-in failed.";
          error.hidden = false;
          button.disabled = false;
          button.textContent = "Sign in";
        }
      });
      container.append(form);
    }

    onSignedOut = () => {
      onSignOut();
      render();
    };
    render();
  }

  return { api, clear, current, errorMessage, login, mount, save, showOneTimeKey };
})();
