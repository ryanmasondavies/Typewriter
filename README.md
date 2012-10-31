Typewriter
==========

When an iOS keyboard is present, TWRTypist can be used to enter a string as follows:

    [TWRTypist typeString:@"Hello world!"];

As of the current moment, the following characters are supported:
*  Uppercase and lowercase letters
*  Spaces
*  Punctuation
*  Special characters (/()£&@[]{}#%^*+=_\|~<>€$¥•)

The following keyboards have been tested:
*  ASCII capable (default)

This library uses private APIs, and so should not be used in production. However, despite this limitation it serves as very useful during testing.

This library is very much a work in progress, and so the API may be subject to simplification and potentially drastic change. A big thanks to the Square crew, as much of the implementation is extracted from KIF (https://github.com/square/KIF).
