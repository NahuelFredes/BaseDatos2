import redis

r = redis.Redis(host='localhost', port=6379, db=0)

r.set('string','hola mundo lindo')
print(r.get('string'))

print(r.getrange( 'string' ,2 ,8)))


dictionaryToSet = {
            'name' : 'redis tutorial' ,
            'description' : 'redis basic commands for caching" likes 20 visitors 23000 '
}

r.HMSET('tutorialspoint' , dictionaryToSet)
print(r.HGETALL('tutorialspoint'))

r.LPUSH( 'tutorials' ,'redis')
r.LPUSH( 'tutorials' ,'mongodb ')
r.LPUSH( 'tutorials' ,'mysql ')
print(r.LRANGE('tutorials',0,10))
