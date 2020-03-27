currency                                                                                                                
------                                                                                                                  
                                                                                                                        
```sh                                                                                                                   
docker-compose build .
docker-compose exec web rails db:migrate
docker-compose exec web rails webpacker:install
docker-compose up
```   
