package grailsapplication3



import org.junit.*
import grails.test.mixin.*

@TestFor(TarjetacreditoController)
@Mock(Tarjetacredito)
class TarjetacreditoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tarjetacredito/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tarjetacreditoInstanceList.size() == 0
        assert model.tarjetacreditoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tarjetacreditoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tarjetacreditoInstance != null
        assert view == '/tarjetacredito/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tarjetacredito/show/1'
        assert controller.flash.message != null
        assert Tarjetacredito.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tarjetacredito/list'

        populateValidParams(params)
        def tarjetacredito = new Tarjetacredito(params)

        assert tarjetacredito.save() != null

        params.id = tarjetacredito.id

        def model = controller.show()

        assert model.tarjetacreditoInstance == tarjetacredito
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tarjetacredito/list'

        populateValidParams(params)
        def tarjetacredito = new Tarjetacredito(params)

        assert tarjetacredito.save() != null

        params.id = tarjetacredito.id

        def model = controller.edit()

        assert model.tarjetacreditoInstance == tarjetacredito
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tarjetacredito/list'

        response.reset()

        populateValidParams(params)
        def tarjetacredito = new Tarjetacredito(params)

        assert tarjetacredito.save() != null

        // test invalid parameters in update
        params.id = tarjetacredito.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tarjetacredito/edit"
        assert model.tarjetacreditoInstance != null

        tarjetacredito.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tarjetacredito/show/$tarjetacredito.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tarjetacredito.clearErrors()

        populateValidParams(params)
        params.id = tarjetacredito.id
        params.version = -1
        controller.update()

        assert view == "/tarjetacredito/edit"
        assert model.tarjetacreditoInstance != null
        assert model.tarjetacreditoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tarjetacredito/list'

        response.reset()

        populateValidParams(params)
        def tarjetacredito = new Tarjetacredito(params)

        assert tarjetacredito.save() != null
        assert Tarjetacredito.count() == 1

        params.id = tarjetacredito.id

        controller.delete()

        assert Tarjetacredito.count() == 0
        assert Tarjetacredito.get(tarjetacredito.id) == null
        assert response.redirectedUrl == '/tarjetacredito/list'
    }
}
