package grailsapplication3



import org.junit.*
import grails.test.mixin.*

@TestFor(ImagenController)
@Mock(Imagen)
class ImagenControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/imagen/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.imagenInstanceList.size() == 0
        assert model.imagenInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.imagenInstance != null
    }

    void testSave() {
        controller.save()

        assert model.imagenInstance != null
        assert view == '/imagen/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/imagen/show/1'
        assert controller.flash.message != null
        assert Imagen.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/imagen/list'

        populateValidParams(params)
        def imagen = new Imagen(params)

        assert imagen.save() != null

        params.id = imagen.id

        def model = controller.show()

        assert model.imagenInstance == imagen
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/imagen/list'

        populateValidParams(params)
        def imagen = new Imagen(params)

        assert imagen.save() != null

        params.id = imagen.id

        def model = controller.edit()

        assert model.imagenInstance == imagen
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/imagen/list'

        response.reset()

        populateValidParams(params)
        def imagen = new Imagen(params)

        assert imagen.save() != null

        // test invalid parameters in update
        params.id = imagen.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/imagen/edit"
        assert model.imagenInstance != null

        imagen.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/imagen/show/$imagen.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        imagen.clearErrors()

        populateValidParams(params)
        params.id = imagen.id
        params.version = -1
        controller.update()

        assert view == "/imagen/edit"
        assert model.imagenInstance != null
        assert model.imagenInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/imagen/list'

        response.reset()

        populateValidParams(params)
        def imagen = new Imagen(params)

        assert imagen.save() != null
        assert Imagen.count() == 1

        params.id = imagen.id

        controller.delete()

        assert Imagen.count() == 0
        assert Imagen.get(imagen.id) == null
        assert response.redirectedUrl == '/imagen/list'
    }
}
