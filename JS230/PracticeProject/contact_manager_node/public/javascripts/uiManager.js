export default 
class UIManager {
  constructor() {
    this.contactTemplate = Handlebars.compile(
      document.getElementById("contact-template").innerHTML
    );
    this.formTemplate = Handlebars.compile(
      document.getElementById("contact-form-template").innerHTML
    );
    this.navSection = document.getElementById("nav-section");
    this.contactList = document.getElementById("contact-list");
    this.noContactsWrapper = document.getElementById("no-contacts-wrapper");
    this.contactFormWrapper = document.getElementById("contact-form-wrapper");
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
      const selectedTag = e.target.value; 
      const contactCards = document.querySelectorAll(".contact-card");
  
      contacts.forEach((contact, index) => {
        document.getElementById("search").value = ""; // avoid logic confusion in the two search mechanincs 
        const card = contactCards[index]; 
        const contactTags = contact.tags || [];
        
        if (contactTags.includes(selectedTag) || selectedTag === "") {
          card.classList.remove('hidden-card');
          card.classList.add('show-card');
        } else {
         
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