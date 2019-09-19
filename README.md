<p align="center">
    <img src ="Resources/Logo.png" width=600 />
</p>

<p align="center">
    <img src="https://img.shields.io/badge/Platform-iOS-brightgreen" alt="Platform" />
    <img src="https://img.shields.io/badge/Swift-5.0-orange.svg" alt="Swift 5.0" />
    <a href="https://twitter.com/mflale">
        <img src="https://img.shields.io/badge/Contact-@mflale-blue.svg?style=flat" alt="Twitter: @mflale" />
    </a>
</p>

<!--# MoveViewwithKeyboard-->

## About

Swift protocol extension for automatically adjusting view offset when keyboard appears/dissapears with only 1 lines of code required for setup propperly.

There is no any pod installation required!

How to use it:
Drag MoveViewwithKeyboard file to you XCode project
In your ViewDidLoad method add "self.setKeyboardMover()"

## Example usage

```swift
class HomeViewController: UIViewController  {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setKeyboardMover()
    }
}
```

## Screenshots

<p align="center">
    <img src ="Resources/screen.gif" width=300 />
</p>
