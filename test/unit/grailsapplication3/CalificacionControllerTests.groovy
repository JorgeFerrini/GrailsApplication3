package grailsapplication3



import org.junit.*
import grails.test.mixin.*

@TestFor(CalificacionController)
@Mock(Calificacion)
class CalificacionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/calificacion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.calificacionInstanceList.size() == 0
        assert model.calificacionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.calificacionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.calificacionInstance != null
        assert view == '/calificacion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/calificacion/show/1'
        assert controller.flash.message != null
        assert Calificacion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/calificacion/list'

        populateValidParams(params)
        def calificacion = new Calificacion(params)

        assert calificacion.save() != null

        params.id = calificacion.id

        def model = controller.show()

        assert model.calificacionInstance == calificacion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/calificacion/list'

        populateValidParams(params)
        def calificacion = new Calificacion(params)

        assert calificacion.save() != null

        params.id = calificacion.id

        def model = controller.edit()

        assert model.calificacionInstance == calificacion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/calificacion/list'

        response.reset()

        populateValidParams(params)
        def calificacion = new Calificacion(params)

        assert calificacion.save() != null

        // test invalid parameters in update
        params.id = calificacion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/calificacion/edit"
        assert model.calificacionInstance != null

        calificacion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/calificacion/show/$calificacion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        calificacion.clearErrors()

        populateValidParams(params)
        params.id = calificacion.id
        params.version = -1
        controller.update()

        assert view == "/calificacion/edit"
        assert model.calificacionInstance != null
        assert model.calificacionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/calificacion/list'

        response.reset()

        populateValidParams(params)
        def calificacion = new Calificacion(params)

        assert calificacion.save() != null
        assert Calificacion.count() == 1

        params.id = calificacion.id

        controller.delete()

        assert Calificacion.count() == 0
        assert Calificacion.get(calificacion.id) == null
        assert response.redirectedUrl == '/calificacion/list'
    }
}
