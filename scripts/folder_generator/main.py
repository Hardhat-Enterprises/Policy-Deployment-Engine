import os
import json
import shutil
import re

import customtkinter as ctk
from tkinter import messagebox

from config import (
    CLOUD_CONFIGS,
    STATE_FILE,
    TEMPLATE_BASE_DIR,
    INPUT_BASE_DIR,
    POLICY_BASE_DIR,
    TEMPLATE_FILES_TF,
    TEMPLATE_POLICY,
    TEMPLATE_VARS,
)

# ---------- Runtime Cache ----------
runtime_cache = {}

# ---------- Utility Functions ----------
def get_cloud_paths(cloud):
    base_cloud = cloud.lower()
    return {
        "template_dir": os.path.join(TEMPLATE_BASE_DIR, base_cloud),
        "input_dir": os.path.join(INPUT_BASE_DIR, base_cloud),
        "policy_dir": os.path.join(POLICY_BASE_DIR, base_cloud),
    }

def save_state(state):
    os.makedirs(os.path.dirname(STATE_FILE), exist_ok=True)
    try:
        with open(STATE_FILE, "w", encoding="utf-8") as f:
            json.dump(state, f, indent=2)
    except Exception:
        pass

def load_state():
    if os.path.exists(STATE_FILE):
        try:
            with open(STATE_FILE, "r", encoding="utf-8") as f:
                return json.load(f)
        except Exception:
            return {}
    return {}

# ---------- Docs Directory Reading ----------
def scan_provider_services(cloud):
    docs_folder = CLOUD_CONFIGS[cloud]["docs_folder"]
    service_resources = {}
    if not os.path.exists(docs_folder):
        print(f"No docs folder for cloud: {cloud}")
        return {}
    for service_name in sorted(os.listdir(docs_folder)):
        service_path = os.path.join(docs_folder, service_name, "resource_json")
        if os.path.isdir(service_path):
            resources = []
            for fname in sorted(os.listdir(service_path)):
                if fname.endswith(".json"):
                    resource_name = fname[:-5]  # strip .json
                    resources.append(resource_name)
            service_resources[service_name] = resources
    return service_resources

def load_all_cloud_services(force_refresh=False):
    global runtime_cache
    if force_refresh or not runtime_cache:
        all_services = {}
        for cloud in CLOUD_CONFIGS:
            all_services[cloud] = scan_provider_services(cloud)
        runtime_cache = all_services
    return runtime_cache

# ---------- File Copy Helper ----------
def copy_files(files, src_dir, dest_dir):
    os.makedirs(dest_dir, exist_ok=True)
    for file in files:
        src = os.path.join(src_dir, file)
        if os.path.exists(src):
            shutil.copyfile(src, os.path.join(dest_dir, file))

def create_policy_files(cloud, service, resource, policy_name):
    if not policy_name:
        messagebox.showerror("Error", "Policy name cannot be empty.")
        return
    paths = get_cloud_paths(cloud)
    base_folder = service.replace(" ", "_")
    subfolder = resource
    input_dir = os.path.join(paths["input_dir"], base_folder, subfolder, policy_name)
    policy_dir = os.path.join(paths["policy_dir"], base_folder, subfolder, policy_name)
    vars_dir = os.path.join(paths["policy_dir"], base_folder, subfolder)
    copy_files(TEMPLATE_FILES_TF, paths["template_dir"], input_dir)
    copy_files([TEMPLATE_POLICY], paths["template_dir"], policy_dir)
    if not os.path.exists(os.path.join(vars_dir, TEMPLATE_VARS)):
        os.makedirs(vars_dir, exist_ok=True)
        shutil.copyfile(os.path.join(paths["template_dir"], TEMPLATE_VARS), os.path.join(vars_dir, TEMPLATE_VARS))
    messagebox.showinfo("Success", f"Created structure for {cloud}/{service}/{resource}/{policy_name}")

# ---------- UI Components ----------
class SearchableDropdown(ctk.CTkFrame):
    def __init__(self, master, values=None, variable=None, placeholder="Select...", command=None, width=400):
        super().__init__(master)
        self.values_all = list(values or [])
        self.variable = variable or ctk.StringVar()
        self.command = command
        self.placeholder = placeholder
        self.dropdown = None
        self.grid_columnconfigure(0, weight=1)
        self.entry = ctk.CTkEntry(self, width=width)
        self.entry.insert(0, self.variable.get() or self.placeholder)
        self.entry.configure(state="disabled")
        self.entry.grid(row=0, column=0, sticky="ew", padx=(0, 6))
        self.btn = ctk.CTkButton(self, text="▼", width=36, command=self.open_dropdown)
        self.btn.grid(row=0, column=1)
    def set_values(self, values):
        self.values_all = list(values or [])
        if self.variable.get() not in self.values_all:
            self.variable.set("")
            self.entry.configure(state="normal")
            self.entry.delete(0, "end")
            self.entry.insert(0, self.placeholder)
            self.entry.configure(state="disabled")
    def set(self, value):
        if value in self.values_all:
            self.variable.set(value)
            self.entry.configure(state="normal")
            self.entry.delete(0, "end")
            self.entry.insert(0, value)
            self.entry.configure(state="disabled")
            if self.command:
                self.command(value)
    def get(self):
        return self.variable.get()
    def open_dropdown(self):
        if self.dropdown and self.dropdown.winfo_exists():
            self.dropdown.focus()
            return
        self.dropdown = ctk.CTkToplevel(self)
        self.dropdown.title("Select")
        self.dropdown.geometry("+%d+%d" % (self.winfo_rootx(), self.winfo_rooty() + self.winfo_height()))
        self.dropdown.transient(self.winfo_toplevel())
        self.dropdown.grab_set()
        self.dropdown.minsize(400, 380)
        self.dropdown.grid_columnconfigure(0, weight=1)
        self.dropdown.grid_rowconfigure(2, weight=1)
        search_var = ctk.StringVar()
        search_entry = ctk.CTkEntry(self.dropdown, placeholder_text="Type to filter...", textvariable=search_var)
        search_entry.grid(row=0, column=0, sticky="ew", padx=12, pady=(12, 6))
        self.count_label = ctk.CTkLabel(self.dropdown, text="")
        self.count_label.grid(row=1, column=0, sticky="w", padx=12, pady=(0, 6))
        list_frame = ctk.CTkScrollableFrame(self.dropdown)
        list_frame.grid(row=2, column=0, sticky="nsew", padx=12, pady=(0, 12))
        btn_holder = {"buttons": []}
        def rebuild_list(filter_text=""):
            for b in btn_holder["buttons"]:
                b.destroy()
            btn_holder["buttons"].clear()
            ft = filter_text.strip().lower()
            filtered = [v for v in self.values_all if ft in v.lower()] if ft else self.values_all
            self.count_label.configure(text=f"{len(filtered)} items")
            for v in filtered:
                b = ctk.CTkButton(list_frame, text=v, anchor="w", command=lambda val=v: on_select(val))
                b.pack(fill="x", padx=6, pady=4)
                btn_holder["buttons"].append(b)
        def on_select(value):
            self.set(value)
            try:
                self.dropdown.destroy()
            except Exception:
                pass
        search_entry.bind("<KeyRelease>", lambda e: rebuild_list(search_var.get()))
        rebuild_list()
        search_entry.focus_set()

# ---------- Main App ----------
class PolicyApp(ctk.CTk):
    def __init__(self, saved_state, all_service_maps):
        super().__init__()
        self.title("Cloud Policy Generator")
        self.geometry("720x560")
        self.saved_state = saved_state
        self.all_service_maps = all_service_maps
        container = ctk.CTkFrame(self, corner_radius=12)
        container.pack(fill="both", expand=True, padx=16, pady=16)
        container.grid_columnconfigure(1, weight=1)
        row = 0
        ctk.CTkLabel(container, text="Cloud").grid(row=row, column=0, sticky="w", padx=10, pady=10)
        self.cloud_var = ctk.StringVar(value=saved_state.get("cloud", "GCP"))
        self.cloud_dropdown = ctk.CTkComboBox(
            master=container,
            values=list(CLOUD_CONFIGS.keys()),
            variable=self.cloud_var,
            state="readonly",
            width=420,
            command=self.on_cloud_change,
        )
        self.cloud_dropdown.grid(row=row, column=1, sticky="ew", padx=10, pady=10)
        row += 1
        ctk.CTkLabel(container, text="Service").grid(row=row, column=0, sticky="w", padx=10, pady=10)
        self.service_var = ctk.StringVar()
        self.service_field = SearchableDropdown(container, values=[], variable=self.service_var,
                                                command=self.on_service_change, width=420)
        self.service_field.grid(row=row, column=1, sticky="ew", padx=10, pady=10)
        row += 1
        ctk.CTkLabel(container, text="Resource").grid(row=row, column=0, sticky="w", padx=10, pady=10)
        self.resource_var = ctk.StringVar()
        self.resource_field = SearchableDropdown(container, values=[], variable=self.resource_var, width=420)
        self.resource_field.grid(row=row, column=1, sticky="ew", padx=10, pady=10)
        row += 1
        ctk.CTkLabel(container, text="Policy Name").grid(row=row, column=0, sticky="w", padx=10, pady=10)
        self.policy_entry = ctk.CTkEntry(container, width=420, placeholder_text="e.g. policy1")
        self.policy_entry.grid(row=row, column=1, sticky="ew", padx=10, pady=10)
        row += 1
        btn_row = ctk.CTkFrame(container, fg_color="transparent")
        btn_row.grid(row=row, column=0, columnspan=2, sticky="ew", padx=10, pady=16)
        create_btn = ctk.CTkButton(btn_row, text="Create Policy", command=self.on_create)
        create_btn.pack(side="left",  padx=(0, 10))
        refresh_btn = ctk.CTkButton(btn_row, text="Refresh Services", command=self.refresh_services)
        refresh_btn.pack(side="left")
        self.service_map = {}
        self.restore_saved_state()
        self.protocol("WM_DELETE_WINDOW", self.on_exit)

    def restore_saved_state(self):
        saved_cloud = self.saved_state.get("cloud", "GCP")
        saved_service = self.saved_state.get("service", "")
        saved_resource = self.saved_state.get("resource", "")
        self.cloud_dropdown.set(saved_cloud)
        self.load_services_for_cloud(saved_cloud)
        if saved_service in self.service_map:
            self.service_field.set(saved_service)
        else:
            services = sorted(list(self.service_map.keys()))
            if services:
                self.service_field.set(services[0])
        self.on_service_change(self.service_var.get())
        resources = self.service_map.get(self.service_var.get(), [])
        if saved_resource in resources:
            self.resource_field.set(saved_resource)
        elif resources:
            self.resource_field.set(resources[0])

    def load_services_for_cloud(self, cloud):
        self.service_map = self.all_service_maps.get(cloud, {})
        self.service_field.set_values(sorted(self.service_map.keys()))

    def refresh_services(self):
        cloud = self.cloud_var.get()
        service_map = scan_provider_services(cloud)
        if not service_map:
            messagebox.showerror("Error", f"Failed to refresh {cloud} services.")
            return
        global runtime_cache
        runtime_cache[cloud] = service_map
        self.all_service_maps[cloud] = service_map
        self.service_map = service_map
        self.service_field.set_values(sorted(service_map.keys()))
        curr_service = self.service_var.get()
        if curr_service in self.service_map:
            self.on_service_change(curr_service)
        else:
            services = sorted(list(self.service_map.keys()))
            if services:
                self.service_field.set(services[0])
                self.on_service_change(services[0])
        messagebox.showinfo("Refreshed", f"{cloud} services refreshed.")

    def on_cloud_change(self, cloud_value):
        self.load_services_for_cloud(cloud_value)
        self.resource_field.set_values([])
        self.resource_var.set("")
        self.policy_entry.delete(0, "end")

    def on_service_change(self, service_value):
        resources = sorted(self.service_map.get(service_value, []))
        self.resource_field.set_values(resources)
        if self.resource_var.get() not in resources:
            if resources:
                self.resource_field.set(resources[0])
            else:
                self.resource_var.set("")
                self.resource_field.entry.configure(state="normal")
                self.resource_field.entry.delete(0, "end")
                self.resource_field.entry.insert(0, self.resource_field.placeholder)
                self.resource_field.entry.configure(state="disabled")

    def on_create(self):
        cloud = self.cloud_var.get()
        service = self.service_var.get()
        resource = self.resource_var.get()
        policy_name = self.policy_entry.get().strip().lower()
        if cloud not in CLOUD_CONFIGS:
            messagebox.showerror("Unsupported", f"Only support clouds: {', '.join(CLOUD_CONFIGS.keys())}")
            return
        if not service:
            messagebox.showerror("Error", "Please select a service.")
            return
        if not resource:
            messagebox.showerror("Error", "Please select a resource.")
            return
        if not policy_name:
            messagebox.showerror("Error", "Policy name cannot be empty.")
            return
        if not re.match(r'^[A-Za-z][A-Za-z_]*$', policy_name):
            messagebox.showerror(
                "Invalid Policy Name",
                "Policy name must only contain alphabets with underscores between words. Examples: MyPolicy, My_Policy, Another_Policy_Test"
            )
            return
        create_policy_files(cloud, service, resource, policy_name)
        self.save_current_state()

    def current_state(self):
        return {
            "cloud": self.cloud_var.get(),
            "service": self.service_var.get(),
            "resource": self.resource_var.get(),
        }

    def save_current_state(self):
        save_state(self.current_state())

    def on_exit(self):
        self.save_current_state()
        self.destroy()

# ---------- Main Entry ----------
if __name__ == "__main__":
    os.makedirs(CLOUD_CONFIGS["GCP"]["docs_folder"], exist_ok=True)  # Ensure docs folder exists
    os.makedirs(os.path.dirname(STATE_FILE), exist_ok=True)  # Ensure state folder exists
    ctk.set_appearance_mode("system")
    ctk.set_default_color_theme("blue")

    saved_state = load_state()
    all_service_maps = load_all_cloud_services(force_refresh=False)

    app = PolicyApp(saved_state, all_service_maps)
    app.mainloop()
