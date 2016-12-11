import React from 'react';
import { storiesOf, action } from '@kadira/storybook';
import Elm from './Elm.js';

import '../src/main.css';
import WeatherCardApp from '../src/Storybook/WeatherCard.elm';
const WeatherCard = WeatherCardApp.Storybook.WeatherCard;
const stories = storiesOf('Weather Card', module);


const states = [
  ['Snow', {deg:-10, weather: 'snow', label: 'heavy snow'}],
  ['SunnyDay', {deg:22, weather: 'sunny', label: 'clear sky'}],
  ['ClearNight', {deg:10, weather: 'night', label: 'clear sky'}],
  ['Storm', {deg:4, weather: 'storm', label: 'heavy thunderstorm'}],
  ['Rain', {deg:7, weather: 'rain', label: 'light rain'}]
]

states.map(story => {
  const [label, flag] = story;
  stories.add(label, () => (
      <div>
        <Elm src={WeatherCard} flags={flag} />
      </div>
    ))
})
