  
  #    GESCHEIT ODER GESCHEITERT ...
  # 1. ################################ CONTROLLER ANLEGEN :
  #    term :rails g controller posts # controller stets plural | model stets singular
  # 2. #################################### VIEW ANLEGEN :
  #    todo :views/posts/index.html.erb   # manuell anlegen
  #    ctnt :<h1>Index</h1><p>Content</p> # Platzhalter anlegen
  # 3. ###################################### ROUTING :
       Blog::Application.routes.draw do     # Generiert ein Set aus 7 Routen für den Controller posts (index create new create show edit destroy (term: rake routes),                          
       resources :posts                     # die das CRUD-Prinzip bedienen - create read update delete (posts_path, new_post_path, post_path(1), edit_post_path(1) )
  # 4. #################################################### MODEL ANLEGEN :
  #    term :rails g model post title:string content:text # Grundmodell mit DB-Informationen wird angelegt.
  #    term :rake db:migrate                              # DB wird angelegt.
  # 5. ############################################################################## POST ANLEGEN :
  #    term :rails c                                                                # irb shell (Schnittstelle Ruby-SQL)
  #    irbs :post = Post.new(:title => "Eintrag 1", :content => "Inhalt Eintrag 1") # legt Post-Daten als Objekt in den Memory
  #    irbs :post.save                                                              # speichert in DB 
  #    info :Post.create (:title="bla", :content => "blablah")                      # Eintrag wird sofort in die DB geschrieben
  #    info :post = Post.find(1)                                                    # Eintrag mit ID 1 wird ausgegeben
  #    info :post = Post.all                                                        # alle einträge werden gelistet
  #    info :post.title = "blah" > post.save                                        # update eines attributes mit save abschlieszen
  #    info :post.update_attribute  (:title, = "bla")                               # ein attribute wird geändert
  #    info :post.update_attributes (:title => "bla", :content => "blabla")         # mehrere attribute werden geändert
  #    info :post(1).destroy                                                        # löscht daensatz mit der id 1
  # 6. ################################################################################ AKTIONEN ANLEGEN :
  #    Aktionen laut rake routes anlegen                                              # posts_controller.rb - Definitionsbereiche anlegen
  #    todo :views/posts/show.html.erb                                                # manuell anlegen
  #    todo :views/posts/new.html.erb                                                 # manuell anlegen
  #    todo :views/posts/edit.html.erb                                                # manuell anlegen
  # 7. ###################################################################################### AKTIONEN DEFINIEREN UND VIEWS ANPASSEN :
  #                                                                                         #                                                   
  #    todo : index aktion - alle Posts abrufen und für das View-File verfügbar machen      # posts_controller.rb - Instanz Variable <= Post Model | @post = Post.all
  #    todo : index view - Instanz-Variable abfragen und in HTML einbetten                  # index.html.erb                                       | @post.each do |post| ... end
  #                                                                                         #                                                      | 
  #    todo : show aktion - index titles zum jeweiligen Eintrag verlinken                   # posts_controller.rb - Instanz Variable <= Post Model | @post = Post.find(params[:id])
  #    todo : show view - Instanz-Variable abfragen und in HTML einbetten                   # show.html.erb                                        | @post.title, etc
  #                                                                                         #                                                      | 
  #    todo : zum new_post_path verlinken                                                   # index.html.erb - Route legen                         |  link_to "Eintrag hinzufügen", new_post_path
  #    todo : new view - Formular erzeugen und in in HTML einbetten                         # new.html.erb - Formular-Felder                       |  form_for @post do |f| ... end
  #    todo : create aktion - Auswertung erfolgreiche Übergabe der Formular-Daten an DB aus # posts_controller.rb - If-Else-Kondition              |  if @post.save ... else ...
  #    todo : create aktion - Flash-Hash füllen                                             # posts_controller.rb - in Schleife einbinden          |  :notice => "blah"  
  #    todo : index view - Flash-Info ausgeben                                              # index.html.erb - Flash-Hash durchlaufen              |  flash.each do |key, value| ... end
  #                                                                                         #                                                      | 
  #    todo : zum new_post_path verlinken                                                   # index.html.erb - Route legen                         |  link_to "Eintrag hinzufügen", new_post_path
  #    todo : edit view - Formular erzeugen und in in HTML einbetten                        # edit.html.erb - Formular-Felder                      |  form_for @post do |f| ... end
  #    todo : update aktion - Auswertung der erfolgreichen Änderung der Model-Attribute     # posts_controller.rb - If-Else-Kondition              |  if @post.update_attributes (params[:post]) ... else ...
  #    todo : update aktion - Flash-Hash füllen                                             # posts_controller.rb - Flash-Hash durchlaufen         |  :notice => "blah"  
  #                                                                                         #                                                      | 
  #    todo : zur delete-methode verlinken mit Java-Script Warnung ausgeben                 # index.html.erb - Route legen                         |  link_to "Loeschen", post, :confirm => "Sicher?", :method => :delete 
  #    todo : destroy aktion - Löschen                                                      # posts_controller.rb - Suchen und zerstören           | @post = Post.find(params[:id]) > @post.destroy
  #    todo : destroy aktion - Flash-Hash füllen                                            # posts_controller.rb - Weiterleitung und Rückmeldung  |  redirect_to posts_path, :notice => "Der Eintrag wurde geloescht."   
  #                                                                                         #                                                      |
  # 8. ###################################################################################### MODEL VALIDIEREN UND WARNUNGEN AUSGEBEN              |
  #    todo : Model erweitern                                                               # post.rb - Daten vor Schreiben in DB prüfen           |  validates :title, :content, :presense => true, etc
  #    todo : new view - Hinweise ausgeben                                                  # new.rb - als Liste einbetten                         |  if @post.errors.any ...
  #    todo : edit view - Hinweise ausgeben                                                 # new.rb - copy & paste ?                              |  if @post.errors.any ... 
  #                                                                                         #
  ########################################################################################### 
  #
       get "log_out" => "sessions#destroy", :as => "log_out"
       get "log_in"  => "sessions#new", :as => "log_in"
       get "sign_up" => "users#new", :as => "sign_up"
       root :to => "posts#index"
       resources :users
       resources :sessions
  #
  #    Locals : Formatierte Datumsausgabe | en.yml
  #    
  #    git init-db : Initialized empty Git repository | https://github.com/ssiemitkowski/playground
  #    
  #    rails g migration AddRoleToUser role:string | Tabellenerweiterungen ...
  #    rails g migration AddStatusToUser status:string
  #    rails g migration AddBenutzernameToUser benutzername:string 
  #    rails g migration AddBenutzernameToUser benutzerkennung:string
  #    rails g migration AddFirmaToUser firma:string
  #    rails g migration AddAnredeToUser anrede:string
  #    rails g migration AddVornameToUser vorname:string
  #    rails g migration AddNachnameToUser nachname:string
  #    rails g migration AddStrasseToUser strasse:string
  #    rails g migration AddHausnummerToUser hausnummer:string
  #    rails g migration AddPostleitzahlToUser postleitzahl:number
  #    rails g migration AddOrtToUser ort:string
  #    rails g migration AddLandToUser land:string
  #    rails g migration AddZeitzoneToUser zeitzone:string
  #    rails g migration AddTelefonToUser telefon:string
  #    rails g migration AddMobileToUser mobile:string
  #    rails g migration AddSteuernummerToUser steuernummer:string
  #    rails g migration AddGeburtsdatumToUser geburtsdatum:date
  #
  #    Rechte-Struktur: siehe view/posts/index.html.erb | Kommentare beschreiben das Rollen-Prinzip
  #    
  #    Snippets: <%= @user.errors.full_messages if @user.errors.any? %> | Ausgabe Errors
  #              <%= User.find(session[:user_id]).id => | current_user.id
  #              <%= url_for :controller => 'users', :action => 'show', :id => current_user.id => | Pfad-Erstellung      
  #              <%  if action_name != "show" %>
  ################################################

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
    root to: 'posts#index', as: 'index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
