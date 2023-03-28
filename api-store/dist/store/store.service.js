"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.StoreService = void 0;
const common_1 = require("@nestjs/common");
const mongoose_1 = require("@nestjs/mongoose");
const mongoose_2 = require("mongoose");
let StoreService = class StoreService {
    constructor(storeModel) {
        this.storeModel = storeModel;
    }
    async create(createStoreDto) {
        const createdStore = new this.storeModel(createStoreDto);
        try {
            return await createdStore.save();
        }
        catch (err) {
            if (err.code === 11000) {
                throw new common_1.ConflictException('Store already exists');
            }
        }
    }
    async findByName(name) {
        return this.storeModel.findOne({ name }).exec();
    }
    async getId(name) {
        const store = await this.storeModel.findOne({ name }).exec();
        return store ? store._id.toString() : null;
    }
    async deleteStoreById(storeId) {
        const result = await this.storeModel.deleteOne({ _id: storeId }).exec();
        if (result.deletedCount === 0) {
            throw new common_1.NotFoundException(`Store with ID ${storeId} not found`);
        }
    }
    async getProducts(storeId) {
        const store = await this.storeModel.findById(storeId).exec();
        if (!store) {
            throw new common_1.NotFoundException(`Store with ID ${storeId} not found`);
        }
        return store.products;
    }
    async findAll() {
        return this.storeModel.find().exec();
    }
};
StoreService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, mongoose_1.InjectModel)('Store')),
    __metadata("design:paramtypes", [mongoose_2.Model])
], StoreService);
exports.StoreService = StoreService;
//# sourceMappingURL=store.service.js.map