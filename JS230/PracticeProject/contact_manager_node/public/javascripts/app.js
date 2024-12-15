class BackendData {
  constructor() {}

  async fetchContacts() {
    try {
      const response = await fetch("/api/contacts");
      if (response.status !== 200)
        throw new Error(`HTTP error: ${response.status}`);
      return await response.json();
    } catch (err) {
      console.log("Data of Contacts can not be loaded", err);
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

class UIManager {
  constructor() {
    this.contactTemplate = Handlebars.compile(
      document.querySelector("#contact-template").innerHTML
    );
    this.formTemplate = Handlebars.compile(
      document.querySelector("#contact-form-template").innerHTML
    );
    this.navSection = document.getElementById("nav-section");
    this.mainHeader = document.getElementById("main-header");
    this.contactList = document.querySelector("#contact-list");
    this.noContactsWrapper = document.querySelector("#no-contacts-wrapper");
    this.contactFormWrapper = document.querySelector("#contact-form-wrapper");
    this.contactForm = document.querySelector("#contact-form");
    this.footer = document.querySelector("footer");
    this.currentTags = new Set();
  }

  initialize() {
    this.contactFormWrapper.style.display = "none";
  }

  renderContacts(contacts) {
    if (contacts.length === 0) {
      this.noContactsWrapper.classList.remove("hidden");
      this.contactList.innerHTML = "";
    } else {
      this.noContactsWrapper.classList.add("hidden");
      this.contactList.innerHTML = this.contactTemplate({ contacts });
    }
  }

  renderTags(tags = []) {
    const tagsWrapper = document.getElementById("tags-wrapper");
    tagsWrapper.innerHTML = this.formTemplate({ tags });
  }

  renderTagsDropdown(uniqueTags) {
    const tagsDropdownTemplate = Handlebars.compile(
      document.getElementById("tags-dropdown-template").innerHTML
    );
    const tagsListElement = document.getElementById("tags_list");
    tagsListElement.innerHTML = tagsDropdownTemplate({ tags: uniqueTags });
  }

  showForm(contact = null) {
    this.contactForm.reset();

    if (contact) {
      document.getElementById("contact-full-name").value = contact.full_name;
      document.getElementById("contact-email").value = contact.email;
      document.getElementById("contact-phone-number").value =
        contact.phone_number;
      this.contactForm.dataset.id = contact.id;
      this.currentTags = new Set(contact.tags || []);
    } else {
      delete this.contactForm.dataset.id;
      this.currentTags = new Set();
    }

    this.renderTags(Array.from(this.currentTags));
    this.animateShowForm();
    this.hideAllExceptHeaderAndFooter();
  }

  hideForm() {
    this.contactFormWrapper.classList.add("fade-out");
    setTimeout(() => {
      this.contactFormWrapper.style.display = "none";
      this.contactFormWrapper.classList.remove("fade-out");
    }, 300);
    this.contactForm.reset();
    this.showAllSections();
  }

  hideAllExceptHeaderAndFooter() {
    this.navSection.style.display = "none";
    this.contactList.style.display = "none";
    this.noContactsWrapper.style.display = "none";
  }

  showAllSections() {
    this.navSection.style.display = "";
    if (this.contactList.children.length > 0) {
      this.contactList.style.display = "flex";
      this.noContactsWrapper.style.display = "none";
    } else {
      this.contactList.style.display = "none";
      this.noContactsWrapper.style.display = "";
    }
    this.contactFormWrapper.style.display = "none";
  }

  async animateRemoveContact(contactId) {
    const contactCard = document.querySelector(
      `.contact-card[data-id="${contactId}"]`
    );

    if (contactCard) {
      contactCard.classList.add("contact-removing");
      await new Promise((resolve) => setTimeout(resolve, 400));
      contactCard.remove();
    }
  }

  animateShowForm() {
    this.contactFormWrapper.style.display = "flex";
    this.contactFormWrapper.classList.add("fade-in");
    setTimeout(() => {
      this.contactFormWrapper.classList.remove("fade-in");
    }, 300);
  }

  bindAddContact(onAdd) {
    const addContactButtons = document.querySelectorAll(".add-contact");
    addContactButtons.forEach((button) =>
      button.addEventListener("click", (event) => {
        event.preventDefault();
        onAdd();
      })
    );
  }

  bindContactAction(onEdit, onDelete) {
    this.contactList.addEventListener("click", (e) => {
      const target = e.target;
      const contactId = target.dataset.id;

      if (target.classList.contains("edit-contact")) {
        onEdit(contactId);
      } else if (target.classList.contains("delete-contact")) {
        onDelete(contactId);
      }
    });
  }

  bindFormSubmit(onSubmit) {
    this.contactForm.addEventListener("submit", (e) => {
      e.preventDefault();
      const contactId = this.contactForm.dataset.id
        ? parseInt(this.contactForm.dataset.id, 10)
        : null;
      const newContact = {
        id: contactId,
        full_name: document.getElementById("contact-full-name").value,
        email: document.getElementById("contact-email").value,
        phone_number: document.getElementById("contact-phone-number").value,
        tags: Array.from(this.currentTags),
      };
      onSubmit(newContact);
    });
  }

  bindFormCancel(onCancel) {
    document.getElementById("cancel-form").addEventListener("click", () => {
      this.hideForm();
      onCancel();
    });
  }

  bindTagsActions() {
    const tagsWrapper = document.getElementById("tags-wrapper");

    tagsWrapper.addEventListener("click", (e) => {
      if (e.target.id === "add-tag-button") {
        const tagInput = document.getElementById("contact-tags");
        const tag = tagInput.value.trim();

        if (tag && !this.currentTags.has(tag)) {
          this.currentTags.add(tag);
          this.renderTags(Array.from(this.currentTags));
        }
        tagInput.value = "";
      }

      if (e.target.classList.contains("remove-tag")) {
        const tag = e.target.dataset.tag;
        this.currentTags.delete(tag);
        this.renderTags(Array.from(this.currentTags));
      }
    });
  }
}

class ValidationManager {
  constructor(contacts) {
    this.contacts = contacts;
  }

  isDuplicate(contact, currentContactId = null) {
    return this.contacts.some((existingContact) => {
      if (existingContact.id === currentContactId) return false;
      return (
        existingContact.full_name.toLowerCase() ===
          contact.full_name.toLowerCase() ||
        existingContact.phone_number === contact.phone_number ||
        existingContact.email === contact.email
      );
    });
  }

  validateFullName(fullName) {
    const fullNameRegex = /^[a-zA-Z]+(?:[-'][a-zA-Z]+)* [a-zA-Z]+(?:[-'][a-zA-Z]+)*$/;
    return fullNameRegex.test(fullName);
  }

  validatePhoneNumber(phoneNumber) {
    const phoneRegex = /^(?:\d{10}|\d{3}-\d{3}-\d{4})$/;
    return phoneRegex.test(phoneNumber);
  }

  validateEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
  }

  validateContact(contact, currentContactId) {
    if (!this.validateFullName(contact.full_name)) {
      return {
        valid: false,
        message: "Full Names must include a First name, a space, and a Last name",
      };
    }
    if (!this.validatePhoneNumber(contact.phone_number)) {
      return {
        valid: false,
        message:
          "Phone numbers must be 10 digits and can also include 3 hyphens. (xxx-xxx-xxx).",
      };
    }

    if (!this.validateEmail(contact.email)) {
      return {
        valid: false,
        message: "Please provide a valid email address.",
      };
    }
    if (this.isDuplicate(contact, currentContactId)) {
      return {
        valid: false,
        message:
          "Full name, Phone number, or this current email address is already included. Please update with new info.",
      };
    }
    return { valid: true };
  }
  clearError() {
    const errorBox = document.getElementById("error-message");
    if (errorBox) {
      errorBox.textContent = ""; // Clear the error message
      errorBox.classList.remove("show"); // Hide the error box
    }
  }
}

class ContactManager {
  constructor() {
    this.backend = new BackendData();
    this.ui = new UIManager();
    this.contacts = [];
  }


  async initialize() {
    this.contacts = await this.backend.fetchContacts();
    this.ui.renderContacts(this.contacts);
    this.ui.initialize();

    this.ui.bindAddContact(() => this.addNewContact());
    this.ui.bindContactAction(
      (id) => this.editContact(id),
      (id) => this.deleteContact(id)
    );
    this.ui.bindFormSubmit((contact) => this.handleFormSubmission(contact));
    this.ui.bindFormCancel(() => this.ui.showAllSections());
  }

  addNewContact() {
    this.ui.showForm();
    this.ui.bindTagsActions();
  }

  async editContact(id) {
    const contact = this.contacts.find((c) => c.id === parseInt(id, 10));
    if (contact) {
      this.ui.showForm(contact);
      this.ui.bindTagsActions();
    }
  }

  async deleteContact(id) {
    await this.ui.animateRemoveContact(id);
    await this.backend.deleteContact(id);
    this.contacts = await this.backend.fetchContacts();
    this.ui.renderContacts(this.contacts);
  }

  async handleFormSubmission(contact) {
    const validation = new ValidationManager();
  
    const validationResult = validation.validateContact(contact, contact.id);
    if (!validationResult.valid) {
      this.ui.displayError(validationResult.message);
      this.ui.clearError()
      return; // Stop further processing
    }
  
    this.ui.clearError(); // Clear any previous errors
  
    if (contact.id && validationResult.valid)  {
      await this.backend.editContact(contact.id, contact);
    } else {
      await this.backend.addContact(contact);
    }
  
    this.contacts = await this.backend.fetchContacts();
    this.ui.renderContacts(this.contacts);
    this.ui.renderTagsDropdown(this.getUniqueTags());
    this.ui.hideForm();
  }

  getUniqueTags() {
    const allTags = this.contacts.flatMap((contact) => contact.tags || []);
    return [...new Set(allTags)];
  }
}

document.addEventListener("DOMContentLoaded", () => {
  const contactManager = new ContactManager();
  contactManager.initialize();
});