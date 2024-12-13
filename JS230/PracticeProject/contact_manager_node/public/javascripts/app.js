class BackendData {
   constructor() {}

   async fetchContacts() {
    try {
        const response = await fetch('/api/contacts'); 
        if (response.status !== 200) throw new Error(`HTTP error: ${response.status}`); 
        let contacts = await response.json(); 
        return contacts; 
    } catch(err) {
        console.log('Data of Contacts can not be loaded', err); 
    }
   }



   async addContact(contact) {
    try {
        const response = await fetch('/api/contacts', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(contact),
        });

        if (!response.ok) {
            throw new Error(`HTTP error: ${response.status}`);
        }

        const result = await response.json();
        console.log('Contact added successfully:', result); // Debugging
        return result;
    } catch (err) {
        console.log('Failed to add contact:', err);
    }
}

   async editContact(id, contact) {
    try {
        const response = await fetch(`/api/contacts/${id}`, {
            method: 'PUT', 
            headers: {'Content-Type':'application/json'}, 
            body: JSON.stringify(contact)
        }); 
        return await response.json(); 

    } catch(err) {
        console.log('Failed to modify contact', err)
    }
   }; 

   async deleteContact(id) {
    try {
        await fetch (`/api/contacts/${id}`, {method: "DELETE"}); 
    } catch (err) {
        console.log('Failed to delete contact:', err)
    }
   }; 


}; 
class UIManager {
  constructor() {
      this.contactTemplate = Handlebars.compile(document.querySelector('#contact-template').innerHTML);
      this.navSection = document.getElementById('nav-section');
      this.mainHeader = document.getElementById('main-header');
      this.contactList = document.querySelector('#contact-list');
      this.noContactsWrapper = document.querySelector('#no-contacts-wrapper');
      this.contactFormWrapper = document.querySelector('#contact-form-wrapper');
      this.contactForm = document.querySelector('#contact-form');
      this.editContact = document.getElementById('edit-contact')
      this.footer = document.querySelector('footer')
  }

  initialize() {
    this.contactFormWrapper.style.display = 'none'; // Ensure the form is hidden on load
  }


  renderContacts(contacts) {
      if (contacts.length === 0) {
          this.noContactsWrapper.classList.remove('hidden');
          this.contactList.innerHTML = '';
      } else {
          this.noContactsWrapper.classList.add('hidden');
          this.contactList.innerHTML = this.contactTemplate({ contacts });
      }
  }

  showForm(contact = null) {
    this.contactForm.reset(); // Clear the form

    // Pre-fill form if editing
    if (contact) {
        document.getElementById('contact-full-name').value = contact.full_name;
        document.getElementById('contact-email').value = contact.email;
        document.getElementById('contact-phone-number').value = contact.phone_number;
        this.contactForm.dataset.id = contact.id 
    } else {
      delete this.contactForm.dataset.id
    }

    // Hide irrelevant sections and show the form
    this.navSection.classList.add('hidden');
    this.contactList.style.display = 'none';
    this.noContactsWrapper.classList.add('hidden');
    this.contactFormWrapper.style.display = 'flex'; // Show the form with flexbox
} 
 

  hideForm() {
    this.contactFormWrapper.style.display = 'none'
    this.showAllSections();  
}

hideAllExceptHeaderAndFooter() {
  this.navSection.style.display = 'none'; // Completely remove from layout
  this.contactList.style.display = 'none'; // Ensure contact list is hidden
  this.noContactsWrapper.style.display = 'none'; // Hide "no contacts" message
}

showAllSections() {
  this.navSection.classList.remove('hidden'); // Show navigation

  if (this.contactList.children.length > 0) {
      this.contactList.style.display = 'flex'; // Ensure contacts are displayed as flex
      this.contactList.classList.remove('hidden');
      this.noContactsWrapper.classList.add('hidden'); // Hide "no contacts" message
  } else {
      this.contactList.style.display = 'none'; // No contacts, hide the list
      this.noContactsWrapper.classList.remove('hidden'); // Show "no contacts" message
  }

  this.contactFormWrapper.style.display = 'none'; // Always hide the form
}

showEditContact(contactId) {
  console.log(`Highlighting contact with ID: ${contactId}`);
  const allContacts = this.contactList.querySelectorAll('.contact-card');
  allContacts.forEach(contactCard => {
      if (contactCard.dataset.id === contactId) {
          contactCard.style.display = 'flex';
          contactCard.classList.add('centered-edit');
      } else {
          contactCard.style.display = 'none';
      }
  });

  this.hideAllExceptHeaderAndFooter();
  this.contactFormWrapper.style.display = 'flex'; // Ensure the form is visible
}

resetContactsView() {
  const allContacts = this.contactList.querySelectorAll('.contact-card');
  allContacts.forEach(contactCard => {
      contactCard.style.display = 'block'; // Ensure all contacts are visible
      contactCard.classList.remove('centered-edit'); // Remove editing style
  });

  // Reset flex display for contact list
  this.contactList.style.display = this.contactList.children.length > 0 ? 'flex' : 'none';
  this.contactList.classList.remove('hidden');

  // Ensure "no contacts" visibility
  if (this.contactList.children.length === 0) {
      this.noContactsWrapper.classList.remove('hidden');
  } else {
      this.noContactsWrapper.classList.add('hidden');
  }
}
  bindAddContact(onAdd) {
      const addContactButtons = document.querySelectorAll('.add-contact');
      addContactButtons.forEach((button) =>
          button.addEventListener('click', (event) => {
              event.preventDefault();
              this.contactForm.classList.add('centered-edit')
              onAdd();
          })
      );
  }

bindContactAction(onEdit, onDelete) {
    this.contactList.addEventListener('click', (e) => {
        const target = e.target;
        const contactId = target.dataset.id;

        if (target.classList.contains('edit-contact')) {
            console.log(`Edit button clicked for contact ID: ${contactId}`); // Debugging
            onEdit(contactId);
        } else if (target.classList.contains('delete-contact')) {
            console.log(`Delete button clicked for contact ID: ${contactId}`); // Debugging
            onDelete(contactId);
        }
    });
}
  bindFormSubmit(onSubmit) {
      this.contactForm.addEventListener('submit', (e) => {
          e.preventDefault();
          const contactId = this.contactForm.dataset.contactId || null
          const newContact = {
              id: contactId ? parseInt(contactId, 10) : null, 
              full_name: document.getElementById('contact-full-name').value,
              email: document.getElementById('contact-email').value,
              phone_number: document.getElementById('contact-phone-number').value,
          };
          onSubmit(newContact);
      });
  }

  bindFormCancel() {
      document.getElementById('cancel-form').addEventListener('click', () => {
          this.hideForm();
          this.resetContactsView();
      });
  }
}


class ValidationManager {
  constructor(contacts) {
    this.contacts = contacts
  }

  isDuplicate(contact, currentContactId = null) {
    return this.contacts.some((existingContact) => {
      console.log(` the curren contact id : ${contact.id}`)
      if (existingContact.id === currentContactId) return false;
      return (
        existingContact.full_name.toLowerCase() === contact.full_name.toLowerCase() || 
        existingContact.phone_number === contact.phone_number || 
        existingContact.email === contact.email
      ); 
    }); 
  }

  ValidateFullName(fullName) {
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
    if (!this.ValidateFullName(contact.full_name)) {
      console.log('name wrong ')
      return {valid: false, message: 'Full Names must include a First name, a space, and a Last name'}
    };
    if (!this.validatePhoneNumber(contact.phone_number)) {
      console.log('number wrong')
      return {valid: false, message: 'Phone numbers must be 10 digits and can also include 3 hyphens. (xxx-xxx-xxx).'}
    }; 

  if (!this.validateEmail(contact.email)) {
    return {valid: false, message: 'Please provide a valid email address.'}
  }
    if (this.isDuplicate(contact, currentContactId)) {
      console.log('is duplicate')
      return {valid: false, message: 'Full name, Phone number, or this current email address is already included. Please update with new info.' }
    };
    return {valid: true}; 
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
    this.ui.contactFormWrapper.style.display = 'none';

    this.ui.bindAddContact(() => this.addNewContact());
    this.ui.bindContactAction(
      (id) => this.ShowEditingContactInfo(id),
      (id) => this.deleteContact(id)
    );
    this.ui.bindFormSubmit(() => this.handleFormSubmission());
    this.ui.bindFormCancel(() => this.ui.showAllSections());
  }

  // Handle the "Add Contact" button
  addNewContact() {
    console.log("Add new contact clicked");
    this.ui.showForm(); // Show an empty form
  }

  // Handle the "Edit Contact" button
  async ShowEditingContactInfo(id) {
    console.log(`Edit contact clicked for ID: ${id}`);
    const contact = this.contacts.find((contact) => contact.id === parseInt(id, 10));
    if (contact) {
      this.ui.showForm(contact); // Pre-fill the form with the contact's data
    } else {
      console.error(`Contact with ID ${id} not found.`);
    }
  }

  // Form submission handler
  async handleFormSubmission() {
    const form = this.ui.contactForm;
    const contactId = form.dataset.id ? parseInt(form.dataset.id, 10) : null; // Use data-id if available

    const newContact = {
        id: contactId, 
        full_name: document.getElementById("contact-full-name").value,
        email: document.getElementById("contact-email").value,
        phone_number: document.getElementById("contact-phone-number").value,
    };

    if (contactId) {
        // Edit flow
        console.log(`Editing contact with ID: ${contactId}`);
        await this.updateContact(newContact);
    } else {
        // Add flow
        console.log("Adding new contact");
        await this.addNewContact(newContact);
    }

    this.contacts = await this.backend.fetchContacts(); // Refresh the contacts list
    //this.ui.renderContacts(this.contacts);
    //this.ui.hideForm(); // Hide the form after submission
}
  // Add a new contact
  async addNewContact(newContact) {
    console.log("Adding contact:", newContact);

    const validator = new ValidationManager(this.contacts);
    const validation = validator.validateContact(newContact);

    if (!validation.valid) {
        this.displayError(validation.message);
        return; // Stop further execution if validation fails
    }

    await this.backend.addContact(newContact);
    this.contacts = await this.backend.fetchContacts(); // Refresh contact list
    this.ui.renderContacts(this.contacts);
    this.ui.hideForm(); // Hide form only after successful addition
}

// Edit an existing contact
async updateContact(contact) {
  console.log("Updating contact:", contact);

  // Validate the contact
  const validator = new ValidationManager(this.contacts);
  const validation = validator.validateContact(contact, contact.id);

  if (!validation.valid) {
      this.displayError(validation.message);
      return;
  }

  // Update the contact in the backend
  const updatedContact = await this.backend.editContact(contact.id, contact);
  this.ui.renderContacts(this.contacts)
  if (!updatedContact) {
      console.error("Failed to update contact in the backend.");
      return;
  }

  console.log("Contact updated in backend:", updatedContact);

  // Refresh contacts and render
  this.contacts = await this.backend.fetchContacts();
  console.log("Contacts after update:", this.contacts);

  this.ui.renderContacts(this.contacts);
  this.ui.hideForm(); // Hide the form after a successful update
}
  // Delete a contact
  async deleteContact(id) {
    console.log(`Deleting contact with ID: ${id}`);
    await this.backend.deleteContact(id);
    this.contacts = await this.backend.fetchContacts();
    this.ui.renderContacts(this.contacts);
  }

  displayError(message) {
    const errorBox = document.getElementById("error-message");
    errorBox.textContent = message;
    errorBox.classList.add("show");

    setTimeout(() => {
      errorBox.classList.remove("show");
    }, 4000);
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const contactManager = new ContactManager(); 
  contactManager.initialize();
})