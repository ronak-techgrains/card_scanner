class RegexMaster {
  static final emailRegex = RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b');
  static final websiteRegExp = RegExp(r'\b(https?:\/\/|www\.)[^\s@]+(?<!mailto:[^\s]+)\b');
  static final phoneRegex = RegExp(r'(\+?\d{1,3})?[-.\s]?\(?\d{1,4}?\)?[-.\s]?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,4}');

  static final zipCodeRegExp = RegExp(r'^(?:\d{5}(-\d{4})?|[A-Za-z]\d[A-Za-z][ -]?\d[A-Za-z]\d|[A-Za-z]{1,2}\d{1,2}[A-Za-z]?\s?\d[A-Za-z]{2}|\d{4}|\d{6}|\d{3}-\d{4})$');

  static final domainNameRegExp = RegExp(r'^(?:https?:\/\/)?(?:www\.)?([^\/\n]+)', caseSensitive: false);
  static final domainRegExp = RegExp(r"^(?:https?://)?(?:[\w-]+\.)?([\w-]+)(?:\.[a-z]{2,})$");

  static const unitPattern =
      r'(?:Suite|Ste|Unit|#|Building|Bldg|Floor|Tower|Block|Apartment|Flat|Room|Office|Shop|Store|Warehouse|Godown|Factory|Mill|Plant|Estate|Complex|Campus|Center|Centre|Park|Square|Plaza|Mall|Market|Bazaar|Arcade|Premises|Property|Facility|Company|Corporation|Organization|Institute|Hospital|Hotel|Inn|GuestHouse|Resort|Clinic|Pharmacy|Garage|Depot|Terminal|Station|Port|Harbor|Arena|Theatre|Cinema|Library|Stadium|Ground|Court|Field|Range|Gym|Spa|Salon|Club)';

  static const streetPattern =
      r'(?:St|Street|Rd|Road|Ave|Avenue|Blvd|Boulevard|Ln|Lane|Dr|Drive|Pl|Place|Ct|Court|Circle|Crescent|Way|Close|Gali|Marg|Nagar|Chowk|Sector|Block|Area|Colony|Layout|Village|Town|City|District|State|Country)';

  static const cityStateZipPattern = r'(?:[A-Za-z]+(?:,\s*[A-Za-z]{2})?\s+\d{5}(?:-\d{4})?|[A-Za-z]+\s*\d{6})';

// Combine the patterns
  static RegExp corporateAddressRegExp = RegExp(
    r'\b' + // Word boundary
        unitPattern +
        r'?\s*' + // Optional unit type
        r'(?:\d+[\w\s-/,.]+)?\s*' + // Address pattern
        streetPattern +
        r'?\s*' + // Street type (optional)
        r'(?:,\s*' +
        unitPattern +
        r'\s*\d+)?' + // Optional unit type and number
        r'\s*,?\s*' +
        cityStateZipPattern + // City, state, and zip/pincode
        r'\b', // Word boundary
    caseSensitive: false,
  );

  static final pincodeRegExp = RegExp(r'\b\d{6}\b'); // Matches 6-digit pincode
  static final cityRegExp = RegExp(r'\b[A-Za-z]+\b'); // Matches city name
  static final landmarkRegExp = RegExp(r'\b(?:Judges Bunglow|Cross Road|Rudra Square)\b'); // Matches specific landmarks
}
