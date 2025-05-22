# Setting Up Your watchOS Development Environment

## Installing Xcode

1. **Open the Mac App Store**
   - Click the App Store icon in your dock or Applications folder
   - Or use Spotlight (Cmd+Space) and type "App Store"

2. **Search for Xcode**
   - Type "Xcode" in the search field
   - Xcode is Apple's official development environment

3. **Download and Install**
   - Click "Get" or the download icon
   - Enter your Apple ID password if prompted
   - The download is large (9-12GB) and may take time depending on your connection
   - Once downloaded, Xcode will automatically install

4. **First Launch**
   - Find Xcode in your Applications folder and launch it
   - During first launch, it will install additional components
   - Accept any license agreements
   - Enter your administrator password if prompted

## Creating a Free Apple Developer Account

1. **Open Safari and go to:**
   - https://developer.apple.com/account/

2. **Sign In**
   - Use your existing Apple ID
   - If you don't have an Apple ID, click "Create Apple ID" and follow the steps

3. **Accept the Apple Developer Agreement**
   - Read and accept the agreement when prompted

4. **Complete Profile**
   - Fill out any required profile information
   - This creates a free Apple Developer account (not the paid program)

## Configuring Xcode with Your Developer Account

1. **Open Xcode Preferences**
   - Open Xcode
   - From the menu bar, select Xcode → Preferences (or use Cmd+,)

2. **Add Your Account**
   - Click the "Accounts" tab
   - Click the + button in the lower left
   - Select "Apple ID"
   - Enter your Apple ID and password
   - Click "Sign In"

3. **Verify Account**
   - Your Apple ID should now appear in the left column
   - The right side will show "Free Account" under the Membership section

## Pairing Your Apple Watch for Development

1. **Ensure Prerequisites**
   - Your iPhone must be paired with your Apple Watch
   - Your iPhone must have Developer Mode enabled (Settings → Privacy & Security → Developer Mode)
   - Both devices must be signed in with the same Apple ID

2. **Enable Developer Mode on Apple Watch**
   - On your iPhone, open the Watch app
   - Go to General → Developer
   - Toggle on "Developer Mode"
   - You may need to restart your Apple Watch

3. **Connect iPhone to Mac**
   - Use a USB cable to connect your iPhone to your Mac
   - Trust the connection if prompted

4. **Configure in Xcode**
   - In Xcode, go to Window → Devices and Simulators
   - Your iPhone and paired Apple Watch should appear in the list
   - If they don't appear, ensure both devices have Developer Mode enabled

## Installing Git for Version Control

1. **Check if Git is Installed**
   - Open Terminal (Applications → Utilities → Terminal)
   - Type `git --version` and press Enter
   - If a version number appears, Git is already installed

2. **Install Git (if needed)**
   - Option 1: Install via Command Line Tools
     - In Terminal, type `xcode-select --install`
     - Click "Install" in the dialog that appears
     - This installs Command Line Tools which includes Git

   - Option 2: Download Git Installer
     - Visit https://git-scm.com/download/mac
     - Download and run the installer
     - Follow the installation instructions

3. **Configure Git**
   - In Terminal, set your name and email:
   ```
   git config --global user.name "Your Name"
   git config --global user.email "your.email@example.com"
   ```

## Creating a GitHub Account

1. **Visit GitHub**
   - Open Safari and go to: https://github.com/join

2. **Sign Up**
   - Enter username, email, and password
   - Complete the verification puzzle
   - Click "Create account"
   - Verify your email address when prompted

3. **Set Up Profile**
   - Add a profile picture if desired
   - Complete any additional profile information

## Testing Your Setup

1. **Create a Simple watchOS App**
   - Open Xcode
   - Select "Create a new Xcode project"
   - Choose "Watch App"
   - Name your project "SailingWatchTest"
   - Choose your Apple ID as the Team
   - Select a location to save the project

2. **Run on Simulator**
   - From the device menu at the top of Xcode window, select an Apple Watch simulator
   - Click the Run button (triangle) or press Cmd+R
   - The simulator should launch and display your app

3. **Run on Physical Device (Optional)**
   - Connect your iPhone to your Mac
   - In the device menu, select your Apple Watch
   - Click Run
   - The app should install on your Apple Watch
   - Note: With a free account, apps will expire after 7 days

## Troubleshooting Common Issues

- **Xcode Not Installing**: Ensure you have sufficient disk space (15GB+) and a stable internet connection
- **Developer Account Issues**: Try signing out and back into your account in Xcode
- **Device Not Appearing**: Make sure both iPhone and Apple Watch have Developer Mode enabled
- **Unable to Run on Device**: Check signing certificates in project settings (automatic signing should be enabled)
- **Simulator Not Working**: Try resetting the simulator (Simulator menu → Reset Content and Settings)

## Next Steps

Once your environment is set up, you'll be ready to explore the open-source projects mentioned in the Week 1 plan and begin customizing one for your sailing needs.