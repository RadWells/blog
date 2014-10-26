# Build your own blog

Hi folks,

Welcome to the first session of a course-long project!

We're going to put together a web-based blog, always building on top of what we put together the week before, using our hard-gained knowledge to improve the project and add features.

Because this is a project, it does not belong inside the main course repository (the one in which you originally received this file). It should be separate.

We are going to begin by building a command-line tool that takes a title for the blog entry as well as some textual content, adds a timestamp, and appends this to a plain-text file.

We have written tests for two-thirds of this to help you along.

The part without tests is the very top-level part of the application: the tool that will print out to the terminal, accept input and pass it along to the rest of the code. The reason why is because it can be surprisingly hard to create tests for a command-line tool and keep them easily readable, and these tests would not be fun for you to read or use.

In order to get started, let's do the following. First, in your terminal, make sure you are in the same directory as this file, then:

```
mkdir -p ~/src/projects/build-my-own-blog
cp -r * ~/src/projects/build-my-own-blog/
cd ~/src/projects/build-my-own-blog
git init
git add .
git commit -m "Add base files for project"
```

Now, we've changed our working directory, so make sure in Atom, Sublime, or your favorite editor, you are opening the files from there.

The `test` directory has the test files.
The `lib` directory has the library code - that's where the bulk of the logic will go.
The `bin` directory is for executables. "bin" is "binaries". This is where the top-level part of the application will go.

Do your work and commit regularly! If there aren't enough tests, feel free to add more.
I recommend working in groups of up to four on this.

Finally, remember that this will eventually be a rather full-featured blog, with tags and searching and other fancy things, and those fancy things are really useless without content. So we recommend you start adding entries! They do not have to be long, but they should reflect something meaningful to you. As you start to use this tool, you will realize you don't WANT to create long entries because, let's face it, the user interface sucks.

The topic for the blog? Preferably what you are learning about in WDI as well as your experience. Towards the end of the course, tomorrow's you will be amazed at what today's you is writing. This being said, if you're very passionate about something else, feel free to use that :)
Consider using it as a note-taking tool as well, for small notes. The title could be "Default Hash value" and the content could be "If you use Hash.new(0) then new keys will use 0 as their default value."

### Bonus questions

What is the difference between `mkdir` and `mkdir -p`?
What is the "working directory" and what are the commands `cwd` and `pwd`?
