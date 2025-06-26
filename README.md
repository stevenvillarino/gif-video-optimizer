# GIF & Video Converter Script

This repository provides a simple, beginner-friendly way to convert any `.mp4` file into:

* Three **optimized animated GIFs** (for email, mid-quality, and web)
* Three **compressed MP4 videos** (great for web use, similar to Amazon-style previews)

No technical experience required. Just follow the step-by-step instructions below.

---

## ✅ What This Script Does

You give it **one video file**, and it gives you **six optimized files**:

### 🖼️ GIFs:

* `yourfile_email.gif` — Very small size, <1.5MB (ideal for email blasts)
* `yourfile_mid.gif` — Middle-ground size & quality
* `yourfile_web.gif` — Best clarity, larger file size

### 🎬 MP4 Videos:

* `yourfile_email.mp4` — Very lightweight
* `yourfile_mid.mp4` — Balanced quality
* `yourfile_web.mp4` — Smoothest playback & resolution

---

## 📦 What You Need to Get Started

### 1. A Mac computer

This guide is Mac-focused. Windows support coming soon.

### 2. Terminal (already included on your Mac)

To open it:

* Press `Command + Space`
* Type `Terminal` and hit `Enter`

### 3. [Homebrew](https://brew.sh/), a package manager for Mac

If you don’t have Homebrew, install it by running this command in Terminal:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 4. FFmpeg (the tool that does the conversion)

Install it by running:

```bash
brew install ffmpeg
```

---

## 🛠️ How to Use This Script

### Step 1: Get the Script File

1. On this GitHub repo, go to the `gif-video-converter.sh` file.
2. Click the **Raw** button.
3. Press `Command + S` (or right-click and choose **Save As**) to save the file to your Desktop.

**OR**

Click the file and copy all of its contents. Then open **TextEdit**, paste it in, and save it as `gif-video-converter.sh` on your Desktop. Make sure to choose **Format → Make Plain Text** before saving.

### Step 2: Make the Script Executable

In Terminal, run:

```bash
chmod +x ~/Desktop/gif-video-converter.sh
```

### Step 3: Run the Script with Your Video

Drag your `.mp4` file into Terminal after typing the script path:

```bash
~/Desktop/gif-video-converter.sh 
```

Example:

```bash
~/Desktop/gif-video-converter.sh /Users/yourname/Desktop/my-video.mp4
```

### Step 4: View Your Outputs

After the script runs, you’ll see six new files:

* 3 GIFs: `*_email.gif`, `*_mid.gif`, `*_web.gif`
* 3 MP4s: `*_email.mp4`, `*_mid.mp4`, `*_web.mp4`

They’ll be saved in the same folder as your original `.mp4` file.

---

## 💡 Tips

* Keep your input videos short (under 30 seconds) for best GIF results
* File sizes vary based on motion, detail, and color — email versions aim for <1.5MB
* Rename or move the script anywhere convenient once it's working

---

## 🧩 Optional: Make It Drag-and-Drop Friendly

Coming soon: a version you can run by dropping your `.mp4` directly onto the script file.

---

## 📂 Coming Soon

* Windows `.bat` script version
* Drag-and-drop app wrapper for macOS
* Optional web UI interface

---

## 📬 Questions or Feedback?

Create an issue in this repo or contact the author. Contributions welcome!
