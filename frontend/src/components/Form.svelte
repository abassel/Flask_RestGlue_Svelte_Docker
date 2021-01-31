<script>

    import {todos} from '../store.js';

    let title = '';
    let description = '';

    // TODO: Consider using https://github.com/flekschas/svelte-simple-modal

    function handleSubmit(event) {
        console.log(event);

        const jq = window.$;
        jq('#modal').modal('hide');

        let data = {title, description};
        console.log(data);

        window.client_api.todo_create(null, data).then(
            function (value) {
                console.log(value); // Success!
                $todos = [...$todos, value['data']];
                // console.log(todos);
            }, function (reason) {
                console.log(reason); // Error!
            });
    }

</script>

<style>

    .custom-btn {
        margin-top: 10px;
        margin-left: 10px;
    }

</style>

<div>

    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary custom-btn" data-toggle="modal" data-target="#modal">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
             class="bi bi-plus-circle-fill" viewBox="0 0 16 16">
            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
        </svg>
        &nbsp;&nbsp;New item
    </button>

    <!-- Modal -->
    <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalLabel">New Todo item</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form>
                    <div class="modal-body">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="title">Title</label>
                                <input bind:value={title} class="form-control" id="title" aria-describedby="titleHelp"
                                       placeholder="Enter title">
                                <small id="titleHelp" class="form-text text-muted">Title for your todo</small>
                            </div>
                            <div class="form-group">
                                <label for="description">Description</label>
                                <input bind:value={description} class="form-control" id="description" placeholder="Description">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" on:click={handleSubmit} class="btn btn-success">Create</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>
