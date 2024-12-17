// helper method for uppercasing words 
import BackendData  from "./backendData.js";
import UIManager from "./uiManager.js";
import ValidationManager from "./validationManager.js";

Handlebars.registerHelper('capitalizeAllFirstLetters', (str) => {
  return str 
  .split(' ')
  .map((word) => word.charAt(0).toUpperCase() + word.slice(1).toLowerCase())
  .join(' ')
})



class ContactManager {
  constructor() {
    this.backend = new BackendData();
    this.ui = new UIManager();
    this.contacts = [];
  }

  async initialize() {
    this.contacts = await this.backend.fetchContacts();
    this.ui.initialize(this.contacts); 
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
      .flatMap((contact) => contact.tags || []) 
      .map((tag) => tag.trim()) 
      .filter((tag) => tag.length > 0); 
  
    return [...new Set(allTags)]; 
  }
}

document.addEventListener("DOMContentLoaded", () => {
  const contactManager = new ContactManager();
  contactManager.initialize();
});