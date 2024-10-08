String? emailValidator(String? value) {
  if (value == null || value.isEmpty) return 'This field is required';

  final emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if (!emailRegex.hasMatch(value)) return 'Enter a valid email';
}
