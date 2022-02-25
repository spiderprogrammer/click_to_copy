# ClickToCopy

## Before Use:

```dart
import 'package:click_to_copy/click_to_copy.dart';
```

### To Copy to clipboard

```dart
  await ClickToCopy.copy(_controller1.text.trim());
```

### To Paste from clipboard

```dart
  await ClickToCopy.paste().then((value) {
        if (value.isNotEmpty) {
            // You will get your value here copied from clipboard.
        }
    });
```