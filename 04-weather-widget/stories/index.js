import React from 'react';
import { storiesOf, action } from '@kadira/storybook';
import Elm from './Elm.js';

import '../src/main.css';

storiesOf('Weather Card', module)
  .add('normal', () => (
    <div>
      Hello World
    </div>
  ))
