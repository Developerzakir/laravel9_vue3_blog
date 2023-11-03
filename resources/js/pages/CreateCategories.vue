<template>
    <div id="create-categories">
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-6 mx-auto">
                    <h1>Create New Category</h1>

                    <div class="success-msg" v-if="success">
                        <i class="fa fa-check"></i>
                        Category Created Successfully!
                    </div>

                    <form @click.prevent="submit">
                        <label for="">Name</label>
                        <input class="form-control" type="text" id="name"  v-model="field.name">
                        <span class="text-danger"   v-if="error.name">{{error.name[0]}}</span>

                        <input type="submit" class="btn btn-primary mt-2" value="Save">
                    </form>

                    <div>
                        <router-link :to="{name: 'CategoryList'}" class="mx-auto">Category Lists</router-link>
                    </div>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
export default {
    data(){
        return{
            field:{},
            error: {},
            success: false
        }
    },

       methods:{
        submit(){
           axios
             .post('/api/categories/create', this.field)
             .then(()=>{
               this.field = {};
               this.error = {};
               this.success = true;

               setInterval(() => {
                this.success = false
                
               }, 2000);

             }).catch((error)=>{
                this.error = error.response.data.error
             })
        } 
    }
}
</script>