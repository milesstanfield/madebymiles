class @Hamburger
  constructor: ->
    @hamburger = $("[data-hook='hamburger']")
    @contentShade = $("[data-hook='content-shade']")
    @menu = $("[data-hook='nav-menu']")
    @clickEvents()
  menuIsClosed: => @menu.hasClass "l-hide"
  openMenu: =>
    @menu.removeClass "l-hide"
    @contentShade.removeClass "l-hide"
  closeMenu: =>
    @menu.addClass "l-hide"
    @contentShade.addClass "l-hide"
  toggleMenu: => if @menuIsClosed() then @openMenu() else @closeMenu()
  clickEvents: =>
    @hamburger.on "click", => @toggleMenu()
    @contentShade.on "click", => @toggleMenu()
