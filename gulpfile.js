var del = require('del');
var gulp = require('gulp');
var elm  = require('gulp-elm');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var stylus = require('gulp-stylus');
var autoprefixer = require('gulp-autoprefixer');
var minifyCSS = require('gulp-minify-css');
 
gulp.task('elm-init', elm.init);
 
gulp.task('elm', ['elm-init'], function(){
  return gulp.src('src/elm/*.elm')
    .pipe(elm())
    .pipe(uglify())
    .pipe(concat('app.min.js'))
    .pipe(gulp.dest('dist/assets/js'))
});

gulp.task('style', function(){
  return gulp.src('src/style/*.styl')
    .pipe(stylus())
    .pipe(minifyCSS())
    .pipe(autoprefixer({browsers: ['> 1%', 'last 2 versions']}))
    .pipe(concat('style.min.css'))
    .pipe(gulp.dest('dist/assets/css'))
});

gulp.task('images', function(){
  return gulp.src('src/images/**/*.{png,jpg,jpeg,gif,svg,ico}')
    .pipe(gulp.dest('dist/assets/img'));
});

gulp.task('html', function(){
  return gulp.src('src/index.html')
    .pipe(gulp.dest('dist/assets'));
});

gulp.task('build', ['elm', 'style', 'images', 'html']);

gulp.task('clean', function(){
  return del(['dist']);
});

gulp.task('watch', function() {
  gulp.watch('src/elm/*.elm', ['elm']);
  gulp.watch('src/style/*.styl', ['style']);
});

gulp.task('default', ['build', 'watch']);

