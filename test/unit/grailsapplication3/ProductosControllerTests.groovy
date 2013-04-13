package grailsapplication3



import org.junit.*
import grails.test.mixin.*

@TestFor(ProductosController)
@Mock(Productos)
class ProductosControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/productos/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.productosInstanceList.size() == 0
        assert model.productosInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.productosInstance != null
    }

    void testSave() {
        controller.save()

        assert model.productosInstance != null
        assert view == '/productos/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/productos/show/1'
        assert controller.flash.message != null
        assert Productos.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/productos/list'

        populateValidParams(params)
        def productos = new Productos(params)

        assert productos.save() != null

        params.id = productos.id

        def model = controller.show()

        assert model.productosInstance == productos
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/productos/list'

        populateValidParams(params)
        def productos = new Productos(params)

        assert productos.save() != null

        params.id = productos.id

        def model = controller.edit()

        assert model.productosInstance == productos
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/productos/list'

        response.reset()

        populateValidParams(params)
        def productos = new Productos(params)

        assert productos.save() != null

        // test invalid parameters in update
        params.id = productos.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/productos/edit"
        assert model.productosInstance != null

        productos.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/productos/show/$productos.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        productos.clearErrors()

        populateValidParams(params)
        params.id = productos.id
        params.version = -1
        controller.update()

        assert view == "/productos/edit"
        assert model.productosInstance != null
        assert model.productosInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/productos/list'

        response.reset()

        populateValidParams(params)
        def productos = new Productos(params)

        assert productos.save() != null
        assert Productos.count() == 1

        params.id = productos.id

        controller.delete()

        assert Productos.count() == 0
        assert Productos.get(productos.id) == null
        assert response.redirectedUrl == '/productos/list'
    }
}
