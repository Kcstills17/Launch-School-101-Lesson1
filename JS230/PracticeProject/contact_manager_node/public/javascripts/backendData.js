export default class BackendData {
  constructor() {}

  async fetchContacts() {
    try {
      const response = await fetch("/api/contacts");
      if (response.status !== 200)
        throw new Error(`HTTP error: ${response.status}`);
      return await response.json();
    } catch (err) {
      console.log("Data of Contacts cannot be loaded", err);
    }
  }

  async addContact(contact) {
    try {
      const response = await fetch("/api/contacts", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(contact),
      });

      if (!response.ok) {
        throw new Error(`HTTP error: ${response.status}`);
      }

      const result = await response.json();
      console.log("Contact added successfully:", result);
      return result;
    } catch (err) {
      console.log("Failed to add contact:", err);
    }
  }

  async editContact(id, contact) {
    try {
      const response = await fetch(`/api/contacts/${id}`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(contact),
      });
      return await response.json();
    } catch (err) {
      console.log("Failed to modify contact", err);
    }
  }

  async deleteContact(id) {
    try {
      const response = await fetch(`/api/contacts/${id}`, {
        method: "DELETE",
        headers: { "Content-Type": "application/json" },
      });

      if (!response.ok) {
        throw new Error(`HTTP error: ${response.status}`);
      }

      console.log(`Backend successfully deleted contact with ID: ${id}`);
    } catch (err) {
      console.error(`Backend failed to delete contact with ID: ${id}`, err);
    }
  }
}
