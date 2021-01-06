class CheckerRouter:

    def db_for_read(self, model, **hints):
        if model._meta.app_label == 'blog':
            return 'blogdb'
        elif model._meta.app_label == 'projects':
            return 'projectsdb'
        return 'default'

    def db_for_write(self, model, **hints):
        if model._meta.app_label == 'blog':
            return 'blog'
        elif model._meta.app_label == 'projects':
            return 'projectsdb'
        return 'default'

    def allow_relation(self, obj1, obj2, **hints):
        if obj1._meta.app_label == 'blog' or obj2._meta.app_label == 'blog':
            return True
        elif 'blog' not in [obj1._meta.app_label, obj2._meta.app_label]:
            return True
        elif obj1._meta.app_label == 'projects' or obj2._meta.app_label == 'projects':
            return True
        elif 'projects' not in [obj1._meta.app_label, obj2._meta.app_label]:
            return True
        return False

    def allow_migrate(self, db, app_label, model_name=None, **hints):
        if app_label == 'blog':
            return db == 'blogdb'
        elif app_label == 'projects':
            return db == 'projectsdb'
        return None