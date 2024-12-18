export default 
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

}
