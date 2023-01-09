var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

const { auth } = require('./actions/auth');

const indexRouter = require('./routes/index');
const kurumlarRouter = require('./routes/kurumlar');
const fakultelerRouter = require('./routes/fakulteler');
const anaBilimDallariRouter = require('./routes/anaBilimDallari');
const uzmanliklarRouter = require('./routes/uzmanliklar');
const kisilerRouter = require('./routes/kisiler');
const doktorlarRouter = require('./routes/doktorlar');
const hastalarRouter = require('./routes/hastalar');
const yardimlarRouter = require('./routes/yardimlar');
const bildirimlerRouter = require('./routes/bildirimler');
const degerlendirmelerRouter = require('./routes/degerlendirmeler');
const mesajlarRouter = require('./routes/mesajlar');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', auth, indexRouter);
app.use('/kurumlar', auth, kurumlarRouter);
app.use('/fakulteler', auth, fakultelerRouter);
app.use('/anaBilimDallari', auth, anaBilimDallariRouter);
app.use('/uzmanliklar', auth, uzmanliklarRouter);
app.use('/kisiler', auth, kisilerRouter);
app.use('/doktorlar', auth, doktorlarRouter);
app.use('/hastalar', auth, hastalarRouter);
app.use('/yardimlar', auth, yardimlarRouter);
app.use('/bildirimler', auth, bildirimlerRouter);
app.use('/degerlendirmeler', auth, degerlendirmelerRouter);
app.use('/mesajlar', auth, mesajlarRouter);

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
