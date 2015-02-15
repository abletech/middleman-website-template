# requires classList.js
window.UI ||= {}
class UI.Manager
  'use strict'

  closeMenu: ->
    document.body.classList.add('menu_closed')

  menuLink: ->
    return @_menuLink if @_menuLink?
    @_menuLink = new UI.MenuLink('menu_link')
    @_menuLink.init()
    @_menuLink

  addCollapsedClasses: ->
    for elem in document.querySelectorAll('.js_to_be_collapsed')
      elem.classList.add('js_collapsed')
      elem.classList.remove('js_to_be_collapsed')

  toggleJSClasses: ->
    html = document.documentElement
    html.classList.remove('no-js')
    html.classList.add('js')

  addResizeHandler: =>
    window.addEventListener 'resize', window.debounce( () =>
      console.log 'resize'
      # if document.body.clientWidth < 600
      #   @homepageLogos().unload()

    , 300)

  init: =>
    # Phase 1, general classes
    @toggleJSClasses()
    @addCollapsedClasses()
    @menuLink()
    @closeMenu()

    # Phase 2, resolution-independent classes
    # @doStuff()

    # Phase 3, resolution-specific classes
    # if document.body.clientWidth < 800
    #   @doStuff().init()

    # Phase 4, Watch the window.resize event
    @addResizeHandler()

ui = new UI.Manager()
ui.init()
