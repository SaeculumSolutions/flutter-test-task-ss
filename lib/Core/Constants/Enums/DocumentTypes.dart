// List of Documents which user can select when filling the form
// Add documents here if required in future, it will reflect the changes in UI automatically
enum DocumentType {
  Passport("Passport"),
  NationalCard("National Card");

  final String string;
  const DocumentType(this.string);
}