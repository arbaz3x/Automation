#!/bin/bash
function create(){

# Create the directory
 mkdir "$1" || { echo "Failed to create directory $1"; return 1; }

    # Change into the newly created directory
 cd "$1" || { echo "Failed to enter directory $1"; return 1; }
# Create the GitHub repository using GitHub CLI
 gh repo create "$1" --public
     # Initialize a new Git repository
git init || { echo "Failed to initialize git repository"; return 1; }

    # Add the remote origin
git remote add origin "https://github.com/arbaz3x/$1.git" || { echo "Failed to add remote origin"; return 1; }

    # Create an initial commit
touch README.md  # Create a README file (optional)
git add README.md
git commit -m "Initial commit" || { echo "Failed to commit changes"; return 1; }

    # Push to the remote repository
git push -u origin main || { echo "Failed to push to remote"; return 1; }
}
create $1
