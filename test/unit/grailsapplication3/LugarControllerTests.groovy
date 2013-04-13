package grailsapplication3



import org.junit.*
import grails.test.mixin.*

@TestFor(LugarController)
@Mock(Lugar)
class LugarControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/lugar/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.lugarInstanceList.size() == 0
        assert model.lugarInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.lugarInstance != null
    }

    void testSave() {
        controller.save()

        assert model.lugarInstance != null
        assert view == '/lugar/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/lugar/show/1'
        assert controller.flash.message != null
        assert Lugar.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/lugar/list'

        populateValidParams(params)
        def lugar = new Lugar(params)

        assert lugar.save() != null

        params.id = lugar.id

        def model = controller.show()

        assert model.lugarInstance == lugar
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/lugar/list'

        populateValidParams(params)
        def lugar = new Lugar(params)

        assert lugar.save() != null

        params.id = lugar.id

        def model = controller.edit()

        assert model.lugarInstance == lugar
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/lugar/list'

        response.reset()

        populateValidParams(params)
        def lugar = new Lugar(params)

        assert lugar.save() != null

        // test invalid parameters in update
        params.id = lugar.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/lugar/edit"
        assert model.lugarInstance != null

        lugar.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/lugar/show/$lugar.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        lugar.clearErrors()

        populateValidParams(params)
        params.id = lugar.id
        params.version = -1
        controller.update()

        assert view == "/lugar/edit"
        assert model.lugarInstance != null
        assert model.lugarInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/lugar/list'

        response.reset()

        populateValidParams(params)
        def lugar = new Lugar(params)

        assert lugar.save() != null
        assert Lugar.count() == 1

        params.id = lugar.id

        controller.delete()

        assert Lugar.count() == 0
        assert Lugar.get(lugar.id) == null
        assert response.redirectedUrl == '/lugar/list'
    }
}
