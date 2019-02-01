import ReactOnRails from 'react-on-rails';
import Poems from '../bundles/Poems/components/poems';

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  Poems,
});
