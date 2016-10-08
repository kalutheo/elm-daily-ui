require('./main.css');

const Elm = require('./Main.elm');

const root  = document.getElementById('root');

const AudioPlayer = {};
let audioObject = new Audio();

AudioPlayer.load = (url) => {
   audioObject.src = url;
}

AudioPlayer.play = () => {
  if (audioObject) {
    audioObject.play();
  }
}

AudioPlayer.pause = () => {
  if (audioObject) {
    audioObject.pause();
  }
}

const app = Elm.Main.embed(root);
app.ports.load.subscribe((track) => {
  AudioPlayer.load(track.url);
  AudioPlayer.play();
})

app.ports.play.subscribe(() => {
  AudioPlayer.play();
})

app.ports.pause.subscribe(() => {
  AudioPlayer.pause();
})

//Expose to window for debugging purpose
window.AudioPlayer = AudioPlayer;
