###

iOS Status Bar

A status bar for iOS devices.

@extends {Layer}

###

class exports.iOSStatusBar extends Layer
	constructor: (options = {}) ->

		_.defaults options,
			name: 'iOS Status Bar'
			height: 20
			width: Screen.width
			backgroundColor: null
			color: black80

			viewKey: undefined

		super options
		
		@color = white # Temporary color

		# LAYERS
			
		@leftContent = new SVGLayer
			name: 'Left Content'
			parent: @
			x: 8
			y: Align.center(3)
			width: 57
			height: 15
			fill: @color
			svg: "<svg>" + 
			"<g transform='translate(0, -2)' stroke-width='0'><path d='M1,7.5 L2,7.5 C2.55228475,7.5 3,7.94771525 3,8.5 L3,11 C3,11.5522847 2.55228475,12 2,12 L1,12 C0.44771525,12 6.76353751e-17,11.5522847 0,11 L0,8.5 C-6.76353751e-17,7.94771525 0.44771525,7.5 1,7.5 Z M5.5,6 L6.5,6 C7.05228475,6 7.5,6.44771525 7.5,7 L7.5,11 C7.5,11.5522847 7.05228475,12 6.5,12 L5.5,12 C4.94771525,12 4.5,11.5522847 4.5,11 L4.5,7 C4.5,6.44771525 4.94771525,6 5.5,6 Z M10,4 L11,4 C11.5522847,4 12,4.44771525 12,5 L12,11 C12,11.5522847 11.5522847,12 11,12 L10,12 C9.44771525,12 9,11.5522847 9,11 L9,5 C9,4.44771525 9.44771525,4 10,4 Z M14.5,2 L15.5,2 C16.0522847,2 16.5,2.44771525 16.5,3 L16.5,11 C16.5,11.5522847 16.0522847,12 15.5,12 L14.5,12 C13.9477153,12 13.5,11.5522847 13.5,11 L13.5,3 C13.5,2.44771525 13.9477153,2 14.5,2 Z'/></g>" +
			"<g transform='translate(-20, -2)' stroke-width='0'><path d='M42,4.82956276 C43.8767533,3.07441257 46.398124,2 49.1704372,2 C51.9427505,2 54.4641212,3.07441257 56.3408745,4.82956276 L54.9256756,6.24476162 C53.4116936,4.85107918 51.3904555,4 49.1704372,4 C46.9504189,4 44.9291808,4.85107918 43.4151989,6.24476162 L42,4.82956276 Z M44.4769681,7.30653087 C45.7185598,6.18377399 47.3646465,5.5 49.1704372,5.5 C50.976228,5.5 52.6223147,6.18377399 53.8639064,7.30653087 L52.4471757,8.72326155 C51.5696364,7.96124278 50.4239013,7.5 49.1704372,7.5 C47.9169731,7.5 46.7712381,7.96124278 45.8936988,8.72326155 L44.4769681,7.30653087 Z M46.9581461,9.78770884 C47.5610912,9.29532392 48.3312759,9 49.1704372,9 C50.0095985,9 50.7797832,9.29532392 51.3827284,9.78770884 L49.1704372,12 L46.9581461,9.78770884 Z'/></g>"
			backgroundColor: null
			style:
				lineHeight: '0px'
		

		@viewKeyLayer = new TextLayer
			parent: @
			name: "View Key"
			y: Align.center(1)
			x: 52
			fontFamily: "Helvetica Neue"
			fontSize: 12
			fontWeight: 500
			letterSpacing: 0.3
			color: @color
			text: "{viewKey}"
			

		@timeLayer = new TextLayer
			name: 'Time'
			parent: @
			width: @width
			y: Align.center(1)
			fontFamily: "Helvetica Neue"
			fontSize: 12
			fontWeight: 500
			letterSpacing: 0.3
			textAlign: "center"
			color: @color
			text: "{date}"

		@timeLayer.templateFormatter =
			date: (v) -> v.toLocaleTimeString([], {hour: 'numeric', minute: '2-digit'})


		@rightContent = new SVGLayer
			name: 'Right Content'
			parent: @
			x: Align.right(-8)
			y: Align.center(3)
			width: 60
			height: 15
			fill: @color
			stroke: @color
			svg: "<svg>" + 
			'<g transform="translate(36, 0)"><path fill="transparent" d="M3.2048565,0.5 C2.26431807,0.5 1.89540921,0.571239588 1.5147423,0.774822479 C1.19446913,0.946106445 0.946106445,1.19446913 0.774822479,1.5147423 C0.571239588,1.89540921 0.5,2.26431807 0.5,3.2048565 L0.5,8.2951435 C0.5,9.23568193 0.571239588,9.60459079 0.774822479,9.9852577 C0.946106445,10.3055309 1.19446913,10.5538936 1.5147423,10.7251775 C1.89540921,10.9287604 2.26431807,11 3.2048565,11 L22.0738202,11 C22.8614775,11 23.5,10.3614775 23.5,9.57382015 L23.5,3.2048565 C23.5,2.26431807 23.4287604,1.89540921 23.2251775,1.5147423 C23.0538936,1.19446913 22.8055309,0.946106445 22.4852577,0.774822479 C22.1045908,0.571239588 21.7356819,0.5 20.7951435,0.5 L3.2048565,0.5 Z"></path>' +
			'<path stroke-width="0" d="M25,4 C25.8626136,4.2220214 26.5,5.00507154 26.5,5.93699126 C26.5,6.86891097 25.8626136,7.65196112 25,7.87398251 L25,4 Z"></path>' +
			'<rect stroke-width="0" x="2" y="2" width="20" height="7.5" rx="0.5"></rect></g>' +
			'<g transform="translate(0, -2)" stroke-width="0"><text font-family="Arial" font-size="12" font-weight="normal"><tspan x="2.85351562" y="11.5">100%</tspan></text></g>'
			backgroundColor: null
			style:
				lineHeight: '0px'


		# DEFINITIONS

		Utils.define @, "viewKey", options.viewKey, @_setViewKey


		# EVENTS

		@app.on "change:time", (date) => 
			@timeLayer.text = date.toLocaleTimeString(['en-US'], {hour: 'numeric', minute: '2-digit'})

		@on "change:color", (color) ->
			for child in @children
				_.assign child,
					color: @color
					fill: @color
					stroke: @color

		@color = options.color


		# CLEANUP

		child.name = '.' for child in @children unless options.showSublayers


		# KICKOFF

		@timeLayer.template = new Date()


	# PRIVATE METHODS

	_setViewKey: (string = "") ->
		@viewKeyLayer.template = string


	# PUBLIC METHODS