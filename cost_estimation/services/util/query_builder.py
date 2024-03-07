from google.cloud import firestore

class FirestoreQueryBuilder:
    def __init__(self, collection):
        self.db = firestore.Client()
        self.collection = self.db.collection(collection)
        self.filters = []

    def add_filter(self, field, operator, value):
        self.filters.append((field, operator, value))
        return self

    def get(self):
        query = self.collection
        for filter in self.filters:
            field, operator, value = filter
            query = query.where(field, operator, value)
        return query.get()

    def reset_filters(self):
        self.filters = []
        return self
    
    def build_query_filters(self, queries):
        for query in queries:
            field = query.get('field')
            operator = query.get('operator')
            value = query.get('value')
            self.add_filter(field, operator, value)
        return self
