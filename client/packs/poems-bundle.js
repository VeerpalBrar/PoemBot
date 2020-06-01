import ReactOnRails from 'react-on-rails';
import Poems from '../bundles/Poems/components/poems';
import PoemsList from '../bundles/Poems/components/poems_list';
import PoemForm from '../bundles/Poems/components/poem_form';



// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  Poems,
  PoemsList,
  PoemForm
});
