require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("trix")
require("@rails/actiontext")

const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

require("scripts");
require("stylesheets");
import "controllers"
