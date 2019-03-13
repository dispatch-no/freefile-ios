
Introduction
============

freefile-ios is a the iOS client for freefile.

Build and Run
=============

Follow these steps :

	git clone https://github.com/dispatch-no/freefile-ios.git
	cd freefile-ios
    pod install
    open freefile.xcworkspace

Then you can run freefile in the Xcode simulator.


SDK and Integration
=================
The freefile SDK is is under development and the api will be clarified soon.
Now, you can use CocoaPods to integrate Seafile in your app.

    pod 'freefile', :git => 'https://github.com/dispatch-no/freefile-ios.git'

If it failed with the following error:

    target has transitive dependencies that include static binaries

Add the following line to your Podfile.

    pre_install do |installer|
        # workaround for https://github.com/CocoaPods/CocoaPods/issues/3289
        def installer.verify_no_static_framework_transitive_dependencies; end
    end
