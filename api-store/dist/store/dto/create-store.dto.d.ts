export declare class CreateStoreDto {
    readonly name: string;
    readonly description: string;
    readonly address: string;
    readonly phone: string;
    readonly products: Product[];
}
declare class Product {
    readonly name: string;
    readonly price: number;
    readonly description: string;
}
export {};
