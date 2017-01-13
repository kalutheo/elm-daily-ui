# Weather Forecast App
## ELM + ReactStorybook = ❤

<img src="story-demo.gif" width="600">

This demo demonstrates a simple Weather Forecast App built with Elm and ["storybooked"](https://ouicar.github.io/2016/08/28/storybook.html) using [React Storybook](https://github.com/storybooks/react-storybook).

React Storybook is an amazing tool that provides the ability to isolate UI Components for testing/documentation purposes.



## How can we achieve that ?

- The Weather Card is isolated in a Elm App: [WeatherCard.elm](https://github.com/kalutheo/elm-daily-ui/blob/master/04-weather-widget/src/Storybook/WeatherCard.elm)
- We use [`programWithFlags`](http://package.elm-lang.org/packages/elm-lang/html/1.1.0/Html-App#programWithFlags)so that we can inject data from Javascript to Elm
- We import these Elm Apps into ReactStoryBook thanks to the [elm-webpack-loader](https://github.com/rtfeldman/elm-webpack-loader)
- These Elm Apps are then wrapped into React thanks to a small wrapper (see : [/stories/Elm.js](https://github.com/kalutheo/elm-calendar-react-storybook/blob/master/app/stories/Elm.js))



## How to run the demo ?

- In case you don't have ELM :
```
npm install elm -g
```

- Elm-App Package Installation :
```
npm install create-elm-app -g
```

- Install project dependencies :
```
cd app
elm-package install
npm install
```

- Run Elm App :
```
elm-app start
```

- Run Storybook :
```
npm run storybook
```

* * *
