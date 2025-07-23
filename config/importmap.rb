# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js", integrity: "sha384-r3ZTYil9ADBQzF56iaVUgFEMGq+fxB3XFhp/OFnM2Fkz8tcpJ2FjrEUclOCrywx2" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "turbo_power", integrity: "sha384-v9Aq6hL99Iok2g2b+2tK/vx9IhabdijKNqaN/uPrcooGSD8Z4v73WnF5keBbG/A4" # @0.7.1
pin "@rails/request.js", to: "@rails--request.js.js", integrity: "sha384-z2lUPjZO6VEVMOJPxOpuSNtmIiFZ3ve951XEs/LRW8w/2PqkFoYIatsvFnW1xCA5" # @0.0.12
pin "@stimulus-components/dropdown", to: "@stimulus-components--dropdown.js", integrity: "sha384-1cnOxxoOVWjVWBLLzpuMJTILdZl57i4RvqVuI5BMfCqYBmMr0/qmGA7/TzH2fEDT" # @3.0.0
pin "stimulus-use", integrity: "sha384-O5f2AjzG0nc9bqizG7UwbuDHG2s91tHAx+dc8IhupBfX45aLHQdDpHUjabpU3dvN" # @0.52.3
