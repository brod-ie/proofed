gulp = require "gulp"
gutil = require "gulp-util"

coffee = require "gulp-coffee"
uglify = require "gulp-uglify"
coffeelint = require "gulp-coffeelint"
notify = require "gulp-notify"
reporter = require("coffeelint-stylish").reporter
rename = require "gulp-rename"
clean = require "gulp-clean"

gulp.task "build", ["clean", "scripts"], ->
  console.log "Built"


gulp.task "clean", ->
  gulp.src("./dist",
    read: false
  ).pipe clean()

gulp.task "scripts", [], ->
  gulp.src "./src/**/*.coffee"
    .pipe do coffeelint
    .pipe do coffeelint.reporter
    .pipe do coffee
    #.pipe do uglify
    .pipe rename( (path) ->
        path.dirname = path.dirname
        path
    )
    .pipe gulp.dest "./dist/"
    .pipe notify
      message: "<%= file.relative %>"
      title: "App compiled"

  gulp.src "./src/public/**/*.*"
    .pipe rename( (path) ->
      path.dirname = "/public"
      path
    )
    .pipe gulp.dest "./dist"
    .pipe notify
      message: "<%= file.relative %>"
      title: "Public updated"

gulp.task "default", ["scripts"], ->
  gulp.watch ["./src/**/*.coffee", "./src/public/**/*.*"], ["scripts"]

# Testing?

# Build

  # test -> build

# Rebuild

  # remove -> test -> build