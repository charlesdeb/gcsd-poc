# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'trix'
pin '@rails/actiontext', to: 'actiontext.js'
pin 'alpinejs', to: 'https://ga.jspm.io/npm:alpinejs@3.10.5/dist/module.esm.js'
pin 'luxon' # @3.1.0
pin 'gcsd'
pin 'timezone_select'

# Helps alpinejs work better with turbo https://github.com/SimoTod/alpine-turbo-drive-adapter
pin 'alpine-turbo-drive-adapter', to: 'https://ga.jspm.io/npm:alpine-turbo-drive-adapter@2.0.0/dist/alpine-turbo-drive-adapter.esm.js'
