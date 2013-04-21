package grailsapplication3



import org.junit.*
import grails.test.mixin.*

@TestFor(CarritoController)
@Mock(Carrito)
class CarritoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/carrito/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.carritoInstanceList.size() == 0
        assert model.carritoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.carritoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.carritoInstance != null
        assert view == '/carrito/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/carrito/show/1'
        assert controller.flash.message != null
        assert Carrito.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/carrito/list'

        populateValidParams(params)
        def carrito = new Carrito(params)

        assert carrito.save() != null

        params.id = carrito.id

        def model = controller.show()

        assert model.carritoInstance == carrito
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/carrito/list'

        populateValidParams(params)
        def carrito = new Carrito(params)

        assert carrito.save() != null

        params.id = carrito.id

        def model = controller.edit()

        assert model.carritoInstance == carrito
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/carrito/list'

        response.reset()

        populateValidParams(params)
        def carrito = new Carrito(params)

        assert carrito.save() != null

        // test invalid parameters in update
        params.id = carrito.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/carrito/edit"
        assert model.carritoInstance != null

        carrito.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/carrito/show/$carrito.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        carrito.clearErrors()

        populateValidParams(params)
        params.id = carrito.id
        params.version = -1
        controller.update()

        assert view == "/carrito/edit"
        assert model.carritoInstance != null
        assert model.carritoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/carrito/list'

        response.reset()

        populateValidParams(params)
        def carrito = new Carrito(params)

        assert carrito.save() != null
        assert Carrito.count() == 1

        params.id = carrito.id

        controller.delete()

        assert Carrito.count() == 0
        assert Carrito.get(carrito.id) == null
        assert response.redirectedUrl == '/carrito/list'
    }
}
