![flutter](https://github.com/rohitm17/Flutter/blob/master/screenshots/flutter-DART.jpg)

<h1>Flutter</h1>

<pre>
Basics of flutter development.

</pre>

     
  
<h2>How to maintain <i>pubspec.yaml</i> file:</h2>

Note: This is <i>.yaml</i> file so use double spaces in indentation and use '#' to comment a line.

    name: name_of_app
    description: A new Flutter application.
    # The following line prevents the package from being accidentally published to
    # pub.dev using `pub publish`. This is preferred for private packages.
    publish_to: 'none' # Remove this line if you wish to publish to pub.dev

    # The following defines the version and build number for your application.
    # A version number is three numbers separated by dots, like 1.2.43
    # followed by an optional build number separated by a +.
    # Both the version and the builder number may be overridden in flutter
    # build by specifying --build-name and --build-number, respectively.
    # In Android, build-name is used as versionName while build-number used as versionCode.
    # Read more about Android versioning at https://developer.android.com/studio/publish/versioning
    # In iOS, build-name is used as CFBundleShortVersionString while build-number used as CFBundleVersion.
    # Read more about iOS versioning at
    # https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
    version: 1.0.0+1

    environment:
      sdk: ">=2.7.0 <3.0.0"
    dependencies:
      flutter:
        sdk: flutter  
      # The following adds the Cupertino Icons font to your application.
      cupertino_icons: ^0.1.3
    dev_dependencies:
      flutter_test:
        sdk: flutter  
        
    flutter:

    # The following line ensures that the Material Icons font is
    # included with your application, so that you can use the icons in
    # the material Icons class.
      uses-material-design: true    
    
    # To add assets to your application, add an assets section, like this:
    # assets:
    #  - images/a_dot_burr.jpeg
    #  - images/a_dot_ham.jpeg
    
    # To add custom fonts to your application, add a fonts section here,
    fonts:
      - family: FreckleFace
        fonts:
          - asset: fonts/FreckleFace-Regular.ttf
