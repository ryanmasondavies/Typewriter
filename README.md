Typewriter
==========

When an iOS keyboard is present, TWRTypist can be used to enter a string as follows:

    [TWRTypist typeString:@"Hello world!"];

As of the current moment, the following characters are supported:
*  Uppercase and lowercase letters
*  Spaces
*  Punctuation
*  Special characters

The following keyboards are tested:
*  ASCII capable (default)

Other keyboards may be functional, but not tested. Feel free to extend this library with tests for other keyboards.

See RMTTypistSpec for a list of the supported characters and keyboards.

This library uses private APIs and should not be used in production. However, despite this limitation it serves as very useful during testing.

This library is very much a work in progress, and so the API may be subject to simplification and potentially drastic change. A big thanks to the Square crew, as much of the implementation is extracted from KIF (https://github.com/square/KIF).
