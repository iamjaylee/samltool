Rails.application.routes.draw do
  root "saml#index"
  post "/fingerprint", to: "saml#fingerprint"
  post "/decode",      to: "saml#decode"
  post "/encode",      to: "saml#encode"
end
