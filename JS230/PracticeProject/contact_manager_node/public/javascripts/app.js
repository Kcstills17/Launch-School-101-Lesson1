// helper method for uppercasing words 

Handlebars.registerHelper('capitalizeAllFirstLetters', (str) => {
  return str 
  .split(' ')
  .map((word) => word.charAt(0).toUpperCase() + word.slice(1).toLowerCase())
  .join(' ')
})




class BackendData {
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

class UIManager {
  constructor() {
    this.contactTemplate = Handlebars.compile(
      document.querySelector("#contact-template").innerHTML
    );
    this.formTemplate = Handlebars.compile(
      document.getElementById("contact-form-template").innerHTML
    );
    this.navSection = document.getElementById("nav-section");
    this.contactList = document.getElementById("contact-list");
    this.noContactsWrapper = document.getElementById("no-contacts-wrapper");
    this.contactFormWrapper = document.querySelector("#contact-form-wrapper");
    this.contactForm = document.getElementById("contact-form");
    this.footer = document.querySelector("footer");
    this.currentTags = new Set();
  }

  initialize(contacts) {
    this.renderContacts(contacts); 
  }
  renderContacts(contacts) {
    if (contacts.length === 0) {
      this.showElement(this.noContactsWrapper);
      this.contactList.innerHTML = "";
    } else {
      this.hideElement(this.noContactsWrapper); 
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
    const tagsListElement = document.getElementById("tags-list");
    tagsListElement.innerHTML = tagsDropdownTemplate({ tags: uniqueTags });
  }

  showForm(contact = null) {
    this.showElement(this.contactFormWrapper);

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
      this.hideElement(this.contactFormWrapper);
      this.contactFormWrapper.classList.remove("fade-out");
    }, 300);
    this.contactForm.reset();
    this.showAllSections();
  }

  hideAllExceptHeaderAndFooter() {
    this.hideElement(this.navSection);
    this.hideElement(this.contactList);
    this.hideElement(this.noContactsWrapper);
  }

  showAllSections() {
    this.showElement(this.navSection);
    if (this.contactList.children.length > 0) {
      this.showElement(this.contactList);
      this.hideElement(this.noContactsWrapper);
    } else {
      this.hideElement(this.contactList);
      this.showElement(this.noContactsWrapper);
    }
    this.hideElement(this.contactFormWrapper);
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
    this.showElement(this.contactFormWrapper);
    this.contactFormWrapper.classList.add("fade-in");
    setTimeout(() => {
      this.contactFormWrapper.classList.remove("fade-in");
    }, 300);
  }

  displayError(message) {
    const errorBox = document.getElementById("error-message");
    if (!errorBox) {
      console.error("Error message container not found in DOM.");
      return;
    }

    errorBox.textContent = message;
    errorBox.classList.add("show");

    setTimeout(() => {
      errorBox.classList.remove("show");
    }, 4000);
  }

  showElement(element) {
    element.classList.remove("hidden");
    element.style.display = "flex";
  }

  hideElement(element) {
    element.classList.add("hidden");
    element.style.display = "none";
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
  bindTagsDropDownlist(contacts) {
  
    const tagsDropDown = document.getElementById('tags-list');
    
    tagsDropDown.addEventListener('change', (e) => {
      const selectedTag = e.target.value; // The selected tag from the dropdown
      const contactCards = document.querySelectorAll(".contact-card");
  
      contacts.forEach((contact, index) => {
        document.getElementById("search").value = ""; // avoid logic confusion in the two search mechanincs 
        const card = contactCards[index]; // Get the corresponding contact card
        const contactTags = contact.tags || []; // Retrieve tags from the contact object
        
        if (contactTags.includes(selectedTag) || selectedTag === "") {
          // Show card if the tag matches or if no tag is selected
          card.classList.remove('hidden-card');
          card.classList.add('show-card');
        } else {
          // Hide the card otherwise
          card.classList.add('hidden-card');
          card.classList.remove('show-card');
        }
      });
    });
  }

  bindSearchQuery(contacts) {
    const searchQuery = document.getElementById("search");
    

    searchQuery.addEventListener("input", () => {
      document.getElementById("tags-list").value = "";
      const searchText = searchQuery.value.toLowerCase().trim();
      const contactCards = document.querySelectorAll(".contact-card");

      contacts.forEach((contact, index) => {
        const card = contactCards[index];
        const fullName = contact.full_name.toLowerCase();

        if (fullName.includes(searchText)) {
          card.classList.remove("hidden-card");
          card.classList.add("show-card");
        } else {
          card.classList.add("hidden-card");
          card.classList.remove("show-card");
        }
      });
    });
  }
}

class ValidationManager {
  constructor(contacts) {
    this.contacts = contacts;
  }

  isDuplicate(contact, currentContactId = null) {
    return this.contacts.some((existingContact) => {
      if (currentContactId !== null && existingContact.id === currentContactId) {
        return false;
      }
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
    const phoneRegex = /^(?:\d{3}-\d{3}-\d{4}|\d{10})$/;
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
        message:
          "Full Names must include a First name, a space, and a Last name",
      };
    }
    if (!this.validatePhoneNumber(contact.phone_number)) {
      return {
        valid: false,
        message:
          "Phone numbers must be 10 digits and include phone format hyphens. (123-456-7899).",
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
    this.ui.initialize(this.contacts); // Pass contacts to UIManager
    this.ui.renderTagsDropdown(this.getUniqueTags());
    this.ui.bindSearchQuery(this.contacts);
    this.ui.bindTagsDropDownlist(this.contacts);
  
    this.ui.bindAddContact(() => this.addNewContact());
    this.ui.bindContactAction(
      (id) => this.editContact(id),
      (id) => this.deleteContact(id)
    );
    this.ui.bindFormSubmit((contact) => this.handleFormSubmission(contact));
    this.ui.bindFormCancel(() => this.ui.showAllSections());
  
    document.getElementById("search").value = "";
    document.getElementById("tags-list").value = "";
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
    document.getElementById("search").value = "";
    document.getElementById("tags-list").value = "";
    this.ui.renderContacts(this.contacts);
    this.ui.renderTagsDropdown(this.getUniqueTags());
  }

  async handleFormSubmission(contact) {
    const validation = new ValidationManager(this.contacts);

    const validationResult = validation.validateContact(contact, contact.id);
    if (!validationResult.valid) {
      this.ui.displayError(validationResult.message);
      this.ui.clearError();
      return; 
    }

    if (contact.id && validationResult.valid) {
      await this.backend.editContact(contact.id, contact);
    } else {
      await this.backend.addContact(contact);
    }

    this.contacts = await this.backend.fetchContacts();
    this.ui.renderContacts(this.contacts);
    this.ui.renderTagsDropdown(this.getUniqueTags());
    this.ui.bindSearchQuery(this.contacts);
    this.ui.bindTagsDropDownlist(this.contacts)
  
    document.getElementById("search").value = "";
    document.getElementById("tags-list").value = "";
    this.ui.hideForm();
  }

  getUniqueTags() {
    const allTags = this.contacts
      .flatMap((contact) => contact.tags || []) //
      .map((tag) => tag.trim()) 
      .filter((tag) => tag.length > 0); 
  
    return [...new Set(allTags)]; 
  }
}

document.addEventListener("DOMContentLoaded", () => {
  const contactManager = new ContactManager();
  contactManager.initialize();
});