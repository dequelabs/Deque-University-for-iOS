# Deque University for iOS

A simple application that demonstrates the difficulties faced by VoiceOver users in using simple Native iOS Applications.  
Each demo is composed of a series of examples that show how the concept can be handled inaccessibly, and what the 
corresponding best practices are. 

<p align="center">
  <img src="/screenshots/side_by_side.png" width="500" alt="Side By side menu and Color Contrast example.">
</p>

# Also Checkout WorldSpace Attest for iOS

This repository also serves as documentation for Deque's automated accessibility analysis Framework. Utilizing Attest you
can find Accessibility Issues automatically. You can utilize Attest for iOS to test your app in a lot of different ways:

- As a Service that runs alongside your Application.
- As an Automated UI Testing Framework
- To Enhanced a Third Party UI Testing Library (like Calabash) to add an Accessibility Testing Step.

Attest for iOS is very flexible and is built to fit into a multitude of workflows. Each example in Deque University has rules
in Attest that will help you debug and build the most Accessible behaviors.

## New Feature - Share Screenshots with XML!

By utilizing our service you get access to powerful Accessibility Debugging tools. 

- Easily Grab screenshots of your application.
- Screenshots include accessibility hierarchy information.
- Accessibility Focusable Elements are highlighted as you explore the screenshot.
- Saving screenshots is as easy as exporting andd saving the html file!

Try it out! Open one [of our captured screenshots](https://cdn.rawgit.com/dequelabs/Deque-University-for-iOS/708e1896/screenshots/screenshot.html) from our application and poke around it with your browsers devtools!

## View Results in Browser

Attach a simple service to your application and view accessibility analysis results in Browser by visiting http://localhost:48485/report/analyze.html. 
Notice the Color Contrast issue highlighted in the screenshot below.

<p align="center">
  <img src="/screenshots/Attest_demo.png" width="800" alt="Screenshot of an emulator next to Attest Results display in browser.">
</p>

## Automated API 

Utilize our automated testing API to get accessibility results from your UI Tests. Then within your tests you can

- Highlight Results and capture screenshots.
- Throw Exceptions for Critical Failures.
- Simply print out an Accessibility Report for that View.

<p align="center">
  <img src="/screenshots/Attest_automated.png" width="800" alt="Screenshot of an emulator next to XCode showing an Attest Accessibility Report.">
</p>

## Advanced Accessibility Debugging Tools

Get a screenshot along with the current hierarchy of elements delivered to Assistive Technologies. This can
speed up remediation and help you understand why various Accessibility Issues are occuring. 

http://localhost:48485/api/screenshot.html

<p align="center">
  <img src="/screenshots/Attest_XML.png" width="800" alt="Screenshot of an emulator next to a browser with Chrome DevTools showing the views Accessibility Hierarchy.">
</p>
