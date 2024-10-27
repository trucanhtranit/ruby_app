Pagy::DEFAULT[:limit] = 25
require 'pagy/extras/size'           # Provide legacy support of old navbars like the above
Pagy::DEFAULT[:size]  = [5, 4, 4, 5] # Array parsed by the extra above
require 'pagy/extras/bootstrap'
