/// The web module should be used to handle the application and request, rather than the app module which should only be used internal, unless views needs to be retrieved.
module web;

import vibe.d;

import diamondapp; // To retrieve views ...

import diamond.configurations.websettings;

class DiamondProjectSettings : WebSettings {
	public:
	this() {
		super();
	}
	
	override bool onBeforeRequest(HTTPServerRequest request, HTTPServerResponse response) {
		return true;
	}
	
	override void onAfterRequest(HTTPServerRequest request, HTTPServerResponse response) {
		// ...
	}
	
	override void onHttpError(HTTPServerRequest request, HTTPServerResponse response, HTTPServerErrorInfo error) {
		auto page = cast(view_errors)getView(request, response, ["errors"], false);

		foreach (headerKey,headerValue; serverSettings.defaultHeaders) {
			response.headers[headerKey] = headerValue;
		}

		response.statusCode = error.code;
		response.bodyWriter.write(page.generate(error));
	}
}

shared static this() {
	WebSettings.initialize(new DiamondProjectSettings);
}